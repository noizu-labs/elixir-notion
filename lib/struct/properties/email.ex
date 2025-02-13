defmodule Notion.Property.Email do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{email: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      email: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{email: value}, opts) do
        %{email: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defstruct [
    id: nil,
    name: nil,
    email: nil,
  ]
  
  def value(value) do
    %Value{email: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      email: json["email"],
    }
  end

end