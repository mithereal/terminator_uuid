use Mix.Config

config :terminator_uuid, Terminator.UUID.Repo,
       username: "postgres",
       password: "postgres",
       database: "terminator_uuid",
       hostname: "localhost",
       primary_key_type: :uuid