defmodule Notion.Property.Relation do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      database_id: nil,
      type: nil,
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(%{database_id: database_id, type: :single_property}, opts) do
        %{relation: %{database_id: database_id, single_property: %{}}}
        |> Jason.Encoder.encode(opts)
      end
      def encode(%{database_id: database_id, type: :dual_property}, opts) do
        %{relation: %{database_id: database_id, dual_property: %{}}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    database_id: nil,
    type: nil,
  ]
  
  @types %{
    "single_property" => :single_property,
    :single_property => :single_property,
    "dual_property" => :dual_property,
    :dual_property => :dual_property,
  }
  
  def definition(database_id, type \\ :single_property) do
    %Definition{
      database_id: database_id,
      type: @types[type]
    }
  end
  
  def from_json(json) do
    IO.inspect(json)
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      #options: Enum.map(json["select"][:options], &Notion.Property.Option.from_json/1),
    }
  end

end