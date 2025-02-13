defmodule Notion.Property.Formula do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      expression: nil,
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(%{expression: expression}, opts) do
        %{formula: %{expression: expression}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defmodule Value do
    defstruct [
      expression: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{expression: value}, opts) do
        %{formula: %{expression:  value}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defstruct [
    id: nil,
    name: nil,
    expression: nil,
  ]
  
  def value(value) do
    %Value{expression: value}
  end
  
  def definition(expression) do
    %Definition{expression: expression}
  end
  
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      expression: json["formula"]["expression"],
    }
  end

end