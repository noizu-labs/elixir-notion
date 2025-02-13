defmodule Notion.Page do
  import Notion.Helpers
  
  defstruct [
    raw: nil,
#
#    id: nil,
#    parent: nil,
#    description: nil,
#    title: nil,
#    cover: nil,
#    url: nil,
#    request_id: nil,
#    properties: nil,
#    icon: nil,
#    created_by: nil,
#    last_edited_by: nil,
#    created_time: nil,
#    last_edited_time: nil,
#    is_inline: nil,
#    public_url: nil,
#    archived: nil,
#    in_trash: nil,
  ]
  
  
  def from_json(json) do
#    properties =
#      (json["properties"] || %{})
#      |> Enum.map(
#           fn {key, value} ->
#             {key, unpack(value)}
#           end
#         )
#      |> Map.new()
    
    %__MODULE__{
#      id: json["id"],
#      parent: Notion.Parent.from_json(json["parent"]),
#      description: unpack(json["description"]),
#      title: unpack(json["title"]),
#      cover: json["cover"], # pending
#      url: unpack(json["url"]),
#      request_id: json["request_id"],
#      properties: properties,
#      icon: json["icon"],
#      created_by: unpack_user(json["created_by"]),
#      created_time: unpack_time(json["created_time"]),
#      last_edited_by: unpack_user(json["last_edited_by"]),
#      last_edited_time: unpack_time(json["last_edited_time"]),
#      is_inline: json["is_inline"],
#      public_url: unpack(json["public_url"]),
#      archived: json["archived"],
#      in_trash: json["in_trash"],
      raw: json,
    }
  end

end