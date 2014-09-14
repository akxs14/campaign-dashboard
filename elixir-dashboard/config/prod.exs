use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, CampaignDashboard.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_campaign_dashboard_key",
  session_secret: "K(6W@$*Z=K*1F+@B*JV79$Q194WM0(BWGIINJ+(%JY*)$0*3K7HWB%^+%_Q+ED7L!L*DW88&KYM6*V*!"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

