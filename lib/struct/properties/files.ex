defmodule Notion.Property.Files do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{files: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defmodule Value do
    defstruct [
      files: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{files: value}, opts) do
        %{files: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    files: nil,
  ]
  
  def value(value) do
    %Value{files: value}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      files: json["files"],
    }
  end

end