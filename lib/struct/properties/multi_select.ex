defmodule Notion.Property.MultiSelect do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      options: nil,
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(%{options: options}, opts) do
        %{multi_select: %{options: options}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defmodule Value do
    defstruct [
      selected: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{selected: values}, opts) do
        values = Enum.map(values, & %{name: &1})
        %{multi_select: values}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defstruct [
    id: nil,
    name: nil,
    options: nil,
  ]
  
  def value(values) when is_list(values) do
    %Value{selected: values}
  end
  def value(value) do
    %Value{selected: [value]}
  end
  
  def definition(options) do
    options = Enum.map(options, &Notion.Property.Option.option/1)
    %Definition{options: options}
  end
  
  def from_json(json) do
    options = Enum.map(json["multi_select"]["options"] || [], &Notion.Property.Option.from_json/1)
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      options: options
    }
  end
  
  def from_json_create(json) do
    options = Enum.map(json["multi_select"]["options"] || [], &Notion.Property.Option.from_json/1)
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      options: options
    }
  end

end