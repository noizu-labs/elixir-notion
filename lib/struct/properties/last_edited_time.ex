defmodule Notion.Property.LastEditedTime do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{last_edited_time: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    last_edited_time: nil,
  ]
  
  
  def definition() do
    %Definition{}
  end
  
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      last_edited_time: json["last_edited_time"],
    }
  end
  
end