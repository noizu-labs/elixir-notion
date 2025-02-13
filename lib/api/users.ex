defmodule Notion.Api.Users do
  import Notion
  
  def list(options \\ []) do
    url = "#{base_url()}/users"
    http_get(url, Notion.List, options)
  end
  
  
end