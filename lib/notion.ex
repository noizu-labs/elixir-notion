defmodule Notion do
  @moduledoc """
  Documentation for `ElixirNotion`.
  """

  require Logger

  @base_url "https://api.notion.com/v1"
  def base_url, do: @base_url

  def http_get(url, model, options \\ [])
  def http_get(url, model, options) do
    api_call(:get, url, nil, model, options)
  end
  
  def http_post(url, body, model, options \\ [])
  def http_post(url, body, model, options) do
    api_call(:post, url, body, model, options)
  end
  
  
  def api_call(type, url, body, model, options)
  def api_call(type, url, body, model, options) do
    raw = options[:raw] || false
    with {:ok, body} <- (body && Jason.encode(body) || {:ok, nil}) ,
         {:ok, %Finch.Response{status: code, body: body} = response} <- api_call_fetch(type, url, body, options),
         true <- (code in [200, 201] || {:error, response}),
         {:ok, json} <- (!raw && Jason.decode(body) || {:ok, body}) do
      if raw do
        {:ok, apply(model, :from_binary, [json])}
      else
        {:ok, apply(model, :from_json, [json])}
      end
    else
      error ->
        Logger.warning("API ERROR: \n #{inspect error}")
        error
    end
  end
  
  def api_call_fetch(type, url, body, options) do
    pool_timeout = options[:pool_timeout] || 600_000
    receive_timeout = options[:receive_timeout] || 600_000
    type
    |> Finch.build(url, headers(options), body)
    |> Finch.request(Notion.Finch, [pool_timeout: pool_timeout, receive_timeout: receive_timeout])
  end
  
  
  def headers(options)
  def headers(options) do
    token = options[:token] || Application.get_env(:elixir_notion, Notion.Api)[:token]
    [
      {"Authorization", "Bearer #{token}"},
      {"Content-Type", "application/json"},
      {"Accept", "application/json"},
      {"Notion-Version", "2022-06-28"},
    ]
  end
  
  
  
  
  
  @doc """
  Hello world.

  ## Examples

      iex> Notion.hello()
      :world

  """
  def hello do
    :world
  end
end
