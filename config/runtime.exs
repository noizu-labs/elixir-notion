import Config

config :elixir_notion, Notion.Api,
  token: System.get_env("NOTION_API_TOKEN")
