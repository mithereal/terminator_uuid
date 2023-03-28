use Mix.Config

config :terminator_uuid, Terminator.UUID.Repo,
       username: "postgres",
       password: "postgres",
       database: "api_dev",
       hostname: "localhost",
       primary_key_type: :uuid