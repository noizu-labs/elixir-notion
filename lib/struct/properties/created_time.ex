defmodule Notion.Property.CreatedTime do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{created_time: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    created_time: nil,
  ]
  
  def definition() do
    %Definition{}
  end
  
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      created_time: json["created_time"],
    }
  end

end