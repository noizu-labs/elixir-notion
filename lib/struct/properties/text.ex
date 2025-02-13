defmodule Notion.Property.Text do
  
  defmodule Definition do
    @vsn 1.0
    defstruct [
      vsn: @vsn
    ]
    
    defimpl Jason.Encoder do
      def encode(_, opts) do
        %{text: %{}}
        |> Jason.Encoder.encode(opts)
      end
    end
  end
  
  defstruct [
    id: nil,
    name: nil,
    text: %{content: nil, link: nil},
    annotations: %{
      code: false,
      color: "default",
      italic: false,
      underline: false,
      bold: false,
      strikethrough: false,
    },
    plain_text: nil,
    href: nil
  ]
  
  def definition() do
    %Definition{}
  end
  
  def new(content, link \\ nil) do
    %__MODULE__{
      text: %{
        content: content,
        link: link,
      },
      plain_text: content
    }
  end
  
  defimpl Jason.Encoder do
    def encode(%{id: nil} = this, opts) do
      %{
        type: :text,
        text: %{
          content: this.text.content,
          link: this.text.link
        },
        annotations: this.annotations,
        plain_text: this.plain_text,
        href: this.href
      }
      |> Jason.Encoder.encode(opts)
    end
  end

  def value(value) when is_bitstring(value) do
    %__MODULE__{
      text: %{content: value, link: nil},
      plain_text: value
    }
  end
  
  def from_json(json) do
    
    annotations = %{
      bold: json["annotations"]["bold"],
      code: json["annotations"]["code"],
      color: json["annotations"]["color"],
      italic: json["annotations"]["italic"],
      strikethrough: json["annotations"]["strikethrough"],
      underline: json["annotations"]["underline"]
    }
    
    text = %{
      content: json["text"]["content"],
      link: json["text"]["link"]
    }
    
    %__MODULE__{
      name: json["name"],
      text: text,
      annotations: annotations,
      plain_text: json["plain_text"],
      href: json["href"]
    }
  end


end