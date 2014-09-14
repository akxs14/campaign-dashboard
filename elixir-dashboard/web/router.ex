defmodule CampaignDashboard.Router do
  use Phoenix.Router

  get "/", CampaignDashboard.PageController, :index, as: :pages

  get   "/campaigns/new", CampaignDashboard.CampaignController, :new
  get   "/campaigns/:id", CampaignDashboard.CampaignController, :show
  get   "/campaigns",     CampaignDashboard.CampaignController, :list
  post  "/campaigns",     CampaignDashboard.CampaignController, :create

end
