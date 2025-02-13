defmodule Notion.Property.Checkbox do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{checkbox: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defmodule Value do
    defstruct [
      checkbox: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{checkbox: value}, opts) do
        %{checkbox: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    checkbox: nil,
  ]
  
  def value(value) do
    %Value{checkbox: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      checkbox: json["checkbox"],
    }
  end

end