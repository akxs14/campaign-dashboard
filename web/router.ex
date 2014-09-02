defmodule CampaignDashboard.Router do
  use Phoenix.Router

  get "/", CampaignDashboard.PageController, :index, as: :pages

  get   "/campaigns",     CampaignDashboard.CampaignController, :list
  get   "/campaigns/:id", CampaignDashboard.CampaignController, :show
  post  "/campaigns",     CampaignDashboard.CampaignController, :create

end