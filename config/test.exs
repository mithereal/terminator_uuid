# Since configuration is shared in umbrella projects, this file
# should only configure the :api application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :terminator_uuid, Terminator.UUID.Repo,
  username: "postgres",
  password: "postgres",
  database: "terminator_uuid",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger,
  level: :info
