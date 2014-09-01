# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, CampaignDashboard.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_campaign_dashboard_key",
  session_secret: "K(6W@$*Z=K*1F+@B*JV79$Q194WM0(BWGIINJ+(%JY*)$0*3K7HWB%^+%_Q+ED7L!L*DW88&KYM6*V*!",
  catch_errors: true,
  debug_errors: false,
  error_controller: CampaignDashboard.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
