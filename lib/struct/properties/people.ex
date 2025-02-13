defmodule Notion.Property.People do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{people: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      people: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{people: value}, opts) do
        %{people: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defstruct [
    id: nil,
    name: nil,
    people: nil,
  ]
  
  def value(value) do
    %Value{people: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      people: json["people"],
    }
  end
  

end