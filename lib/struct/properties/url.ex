defmodule Notion.Property.Url do
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{url: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      url: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{url: value}, opts) do
        %{url: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    url: nil,
  ]
  
  def value(value) when is_bitstring(value) do
    %Value{url: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      url: json["url"],
    }
  end
  
end