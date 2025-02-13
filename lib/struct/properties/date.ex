defmodule Notion.Property.Date do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{date: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defmodule Value do
    defstruct [
      date: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{date: value}, opts) do
        %{date: %{start: value}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    date: nil,
  ]
  
  def value(value) do
    %Value{date: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      date: json["date"],
    }
  end

end