defmodule Notion.Api.Pages do
  import Notion
  
  def create(parent, properties, icon \\ nil, cover \\ nil, options \\ []) do
    url = "#{base_url()}/pages"
    
    body = %{
      parent: parent,
      properties: properties,
    }
    http_post(url, body, Notion.Page, options)
  end
  

end