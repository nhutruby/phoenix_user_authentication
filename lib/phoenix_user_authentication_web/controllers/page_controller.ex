defmodule PhoenixUserAuthenticationWeb.PageController do
  use PhoenixUserAuthenticationWeb, :controller
  require Logger
  def index(conn, _params) do
    Logger.info("logaaaaaaaaaa")
    user = Guardian.Plug.current_resource(conn)
    Logger.info(user)
    render(conn, "index.html", current_user: user)
  end
end
