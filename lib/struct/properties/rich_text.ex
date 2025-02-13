defmodule Notion.Property.RichText do
  
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{rich_text: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      rich_text: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{rich_text: value}, opts) do
        %{rich_text: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defstruct [
    id: nil,
    name: nil,
    rich_text: nil,
  ]
  
  def value(value) when is_bitstring(value) do
    %Value{rich_text: [Notion.Property.Text.value(value)]}
  end
  
  def definition() do
    %Definition{}
  end
  
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      rich_text: json["rich_text"],
    }
  end
  
  

end