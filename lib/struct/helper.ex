defmodule Notion.Helpers do
  
  @handlers %{
    "checkbox" => Notion.Property.Checkbox,
    "created_by" => Notion.Property.CreatedBy,
    "created_time" => Notion.Property.CreatedTime,
    "date" => Notion.Property.Date,
    "email" => Notion.Property.Email,
    "files" => Notion.Property.Files,
    "formula" => Notion.Property.Formula,
    "last_edited_by" => Notion.Property.LastEditedBy,
    "last_edited_time" => Notion.Property.LastEditedTime,
    "multi_select" => Notion.Property.MultiSelect,
    "number" => Notion.Property.Number,
    "people" => Notion.Property.People,
    "phone_number" => Notion.Property.PhoneNumber,
    "relation" => Notion.Property.Relation,
    "rich_text" => Notion.Property.RichText,
    "rollup" => Notion.Property.Rollup,
    "select" => Notion.Property.Select,
    "text" => Notion.Property.Text,
    "title" => Notion.Property.Title,
    "url" => Notion.Property.Url,
  }
  
  def unpack_user(%{"id" => id, "object" => "user"}), do: %{user: id}
  def unpack_user(x), do: x
  
  def unpack_time(nil), do: nil
  def unpack_time(x) do
    case DateTime.from_iso8601(x) do
      {:ok, datetime} -> datetime
      {:ok, datetime, _} -> datetime
      _ -> nil
    end
  end
  
  def unpack(x) when is_list(x) do
    Enum.map(x, &unpack/1)
  end
  def unpack(%{"type" => type} = json) do
    if handler = @handlers[type] do
      handler.from_json(json)
    end
  end
  def unpack(_), do: nil
  
end