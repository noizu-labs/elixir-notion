defmodule Notion.Property.Number do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn,
      format: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{format: nil}, opts) do
        %{number: %{}}
        |> Jason.Encoder.encode(opts)
      end
      def encode(%{format: format}, opts) do
        %{number: %{format: format}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      number: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{number: value}, opts) do
        %{number: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  
  defstruct [
    id: nil,
    name: nil,
    number: nil,
    format: nil,
  ]
  
  def value(value) do
    %Value{number: value}
  end
  
  def definition(format \\ nil) do
    %Definition{format: format}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      number: nil,
      format: json["number"]["format"],
    }
  end
  
end