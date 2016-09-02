use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :hello_phoenix, HelloPhoenix.Endpoint,
  secret_key_base: "fsdT2LueHiqOMIVvbx1yhvqemXDLvPFmnJDC8DDFLL05YAMDw5ijwfpAs0Bb4tQ1"

# Configure your database
config :hello_phoenix, HelloPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: {:system, "RDS_USERNAME"},
  password: {:system, "RDS_PASSWORD"},
  database: {:system, "RDS_DB_NAME"},
  pool_size: 20
