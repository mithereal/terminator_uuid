# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :terminator_uuid,
  ecto_repos: [Terminator.UUID.Repo]

config :terminator_uuid, Terminator.UUID.Repo,
  username: "postgres",
  password: "postgres",
  database: "api_dev",
  hostname: "localhost"

if File.exists?(Path.join(Path.dirname(__ENV__.file), "#{Mix.env()}.exs")) do
  import_config "#{Mix.env()}.exs"
end
