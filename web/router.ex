defmodule CampaignDashboard.Router do
  use Phoenix.Router

  get "/", CampaignDashboard.PageController, :index, as: :pages

end
