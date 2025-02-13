defmodule Notion.Property.Rollup do
  
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      relation_property_name: nil,
      relation_property_id: nil,
      rollup_property_name: nil,
      rollup_property_id: nil,
      function: nil,
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(this, opts) do
        rollup = [
                   relation_property_name: this.relation_property_name,
                   relation_property_id: this.relation_property_id,
                   rollup_property_name: this.rollup_property_name,
                   rollup_property_id: this.rollup_property_id,
                   function: this.function,
                 ] |> Enum.reject(fn {_, v} -> is_nil(v) end)
                 |> Map.new()
        
        %{rollup: rollup}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    
    relation_property_name: nil,
    relation_property_id: nil,
    rollup_property_name: nil,
    rollup_property_id: nil,
    function: nil,
  ]
  
  @functions %{
    "count_all" => :count_call,
    :count_all => :count_call,
    "count_values" => :count_values,
    :count_values => :count_values,
    "count_unique_values" => :count_unique_values,
    :count_unique_values => :count_unique_values,
    "count_empty" => :count_empty,
    :count_empty => :count_empty,
    "count_not_empty" => :count_not_empty,
    :count_not_empty => :count_not_empty,
    "percent_empty" => :percent_empty,
    :percent_empty => :percent_empty,
    "percent_not_empty" => :percent_not_empty,
    :percent_not_empty => :percent_not_empty,
    "sum" => :sum,
    :sum => :sum,
    "average" => :average,
    :average => :average,
    "median" => :median,
    :median => :median,
    "min" => :min,
    :min => :min,
    "max" => :max,
    :max => :max,
    "range" => :range,
    :range => :range,
    "show_original" => :show_original,
    :show_original => :show_original,
  }
  
  def definition(options \\ []) do
    %Definition{
      relation_property_name: options[:relation_property_name],
      relation_property_id: options[:relation_property_id],
      rollup_property_name: options[:rollup_property_name],
      rollup_property_id: options[:rollup_property_id],
      function: @functions[options[:function]],
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