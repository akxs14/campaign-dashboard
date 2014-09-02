defmodule CampaignDashboard.PageController do
  use Phoenix.Controller

  def campaigns(conn, _params) do
    render conn, "campaigns"
  end

  def show(conn, _params) do
    render conn, "campaigns"
  end

  def create(conn, _params) do
    render conn, "campaigns"
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
