defmodule Notion.List do

  defstruct [
    results: [],
    next_cursor: nil,
    has_more: false,
    type: nil,
    request_id: nil,
  ]

  def from_json(%{"object" => "list", "type" => "user"} = json) do
    %__MODULE__{
      results: Enum.map(json["results"], &Notion.User.from_json/1),
      next_cursor: json["next_cursor"],
      has_more: json["has_more"],
      type: :user,
      request_id: json["request_id"],
    }
  end
  
  
end