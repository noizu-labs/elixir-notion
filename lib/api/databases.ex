defmodule Notion.Api.Databases do
  import Notion
  
  def create(parent, title, properties, icon \\ nil, cover \\ nil, options \\ []) do
    url = "#{base_url()}/databases"
    
    title = case title do
      x when is_bitstring(x) -> [Notion.Property.Text.new(x)]
      x -> x
    end
    
    body = %{
      parent: parent,
      title: title,
      properties: properties,
    }
    
    http_post(url, body, Notion.Database, options)
  end


end