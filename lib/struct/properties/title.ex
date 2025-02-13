defmodule Notion.Property.Title do
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{title: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  
  defmodule Value do
    defstruct [
      title: nil,
    ]
    
    defimpl Jason.Encoder do
      def encode(%{title: value}, opts) do
        %{title: value}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    title: nil,
  ]
  
  def value(value) when is_bitstring(value) do
    %Value{title: [Notion.Property.Text.value(value)]}
  end
  
  def definition() do
    %Definition{}
  end
  
  def from_json(json) do
    %__MODULE__{
      id: json["id"],
      name: json["name"],
      title: json["title"],
    }
  end
  
  defimpl Jason.Encoder do
    def encode(this, opts) do
      %{
        title: this.title
      }
      |> Jason.Encoder.encode(opts)
    end
  end
  

end