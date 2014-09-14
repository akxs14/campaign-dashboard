use Mix.Config

config :phoenix, CampaignDashboard.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_campaign_dashboard_key",
  session_secret: "K(6W@$*Z=K*1F+@B*JV79$Q194WM0(BWGIINJ+(%JY*)$0*3K7HWB%^+%_Q+ED7L!L*DW88&KYM6*V*!"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


