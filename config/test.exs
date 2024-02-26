import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tetrishq, TetrishqWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oR7cAAxqxO/LtaJi4wEdizfwLGvL+ikdO51m6lniCLKUlWg/kGs9QKOzJ9C8a9GR",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
