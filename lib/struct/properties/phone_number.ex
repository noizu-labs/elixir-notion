defmodule Notion.Property.PhoneNumber do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{phone_number: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      phone_number: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{phone_number: value}, opts) do
        %{phone_number: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    phone_number: nil,
  ]
  
  def value(value) do
    %Value{phone_number: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      phone_number: json["phone_number"],
    }
  end
  
end