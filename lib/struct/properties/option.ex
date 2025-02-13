defmodule Notion.Property.Option do
  
  defstruct [
    id: nil,
    name: nil,
    description: nil,
    color: nil,
  ]
  
  
  def option(name) when is_bitstring(name) do
    %__MODULE__{name: name}
  end
  def option(%__MODULE__{} = option), do: option
  def option(%{name: name} = options) do
    %__MODULE__{name: name, color: Map.get(options, :color)}
  end
  
  defimpl Jason.Encoder do
    def encode(%Notion.Property.Option{name: name, color: nil}, opts) do
      %{name: name} |> Jason.Encoder.encode(opts)
    end
    def encode(%Notion.Property.Option{name: name, color: color}, opts) do
      %{name: name, color: color} |> Jason.Encoder.encode(opts)
    end
  end

  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      description: json["description"],
      color: json["color"],
    }
  end

end