defmodule Notion.Parent do

  defstruct [
    type: nil,
    id: nil
  ]

  def page(id) do
    %__MODULE__{type: :page_id, id: id}
  end
  def database(id) do
    %__MODULE__{type: :database_id, id: id}
  end
  def block(id) do
    %__MODULE__{type: :block_id, id: id}
  end
  def workspace do
    %__MODULE__{type: :workspace}
  end
  
  defimpl Jason.Encoder do
    def encode(%Notion.Parent{type: :page_id, id: id}, opts) do
      %{type: :page_id, page_id: id} |> Jason.Encoder.encode(opts)
    end
    def encode(%Notion.Parent{type: :database_id, id: id}, opts) do
      %{type: :database_id, database_id: id} |> Jason.Encoder.encode(opts)
    end
    def encode(%Notion.Parent{type: :block_id, id: id}, opts) do
      %{type: :block_id, block_id: id} |> Jason.Encoder.encode(opts)
    end
    def encode(%Notion.Parent{type: :workspace}, opts) do
      %{type: :workspace, workspace: true} |> Jason.Encoder.encode(opts)
    end
  end

  def from_json(%{"type" => "page_id", "page_id" => id}) do
    %__MODULE__{type: :page_id, id: id}
  end
  def from_json(%{"type" => "database_id", "database_id" => id}) do
    %__MODULE__{type: :database_id, id: id}
  end
  def from_json(%{"type" => "block_id", "block_id" => id}) do
    %__MODULE__{type: :block_id, id: id}
  end
  def from_json(%{"type" => "workspace"}) do
    %__MODULE__{type: :workspace}
  end
  def from_json(_), do: nil
  
end