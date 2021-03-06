# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :bitcoin_network, magic: <<0x0B, 0x11, 0x09, 0x07>>

config :bitcoin_network,
  ip: <<0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xFF, 0xFF, 127, 0, 0, 1>>

config :bitcoin_network, port: 18333

config :bitcoin_network, version: 70015
config :bitcoin_network, services: 1
config :bitcoin_network, user_agent: "Elixir rules!"

config :bitcoin_network, max_retries: 3
config :bitcoin_network, max_peers: 125
config :bitcoin_network, ping_time: 15_000
config :bitcoin_network, timeout: 30_000

config :logger,
  backends: [:console],
  compile_time_purge_level: :info

config :logger, :console,
  colors: [enabled: true],
  format:
    [
      :reset,
      :light_black,
      "[ $metadata]",
      :reset,
      " $message\n"
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string(),
  metadata: [:pid]

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :bitcoin_network, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:bitcoin_network, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
