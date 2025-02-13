defmodule Notion.User do

  
  defmodule Person do
    defstruct [
      id: nil,
      name: nil,
      avatar_url: nil,
      email: nil,
    ]
    
    def from_json(json)
    def from_json(json) do
      %__MODULE__{
        id: json.id,
        name: json.name,
        avatar_url: json.avatar_url,
        email: json.person.email,
      }
    end
  end
  
  defmodule Bot do
    defstruct [
      id: nil,
      name: nil,
      avatar_url: nil,
      owner: nil,
      workspace_name: nil,
    ]
    
    def from_json(json)
    def from_json(json) do
      %__MODULE__{
        id: json.id,
        name: json.name,
        avatar_url: json.avatar_url,
        owner: json.bot.owner,
        workspace_name: json.bot.workspace_name,
      }
    end
  end
  
  def from_json(json)
  def from_json(json = %{type: "bot"}), do: Bot.from_json(json)
  def from_json(json = %{type: "person"}), do: Person.from_json(json)

end