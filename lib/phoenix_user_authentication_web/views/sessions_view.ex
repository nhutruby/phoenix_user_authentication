defmodule PhoenixUserAuthenticationWeb.SessionView do
  use PhoenixUserAuthenticationWeb, :view
  alias PhoenixUserAuthenticationWeb.SessionView
  def render("show.json", %{user: user}) do
    %{
      user: user_json(user)
    }
  end

  def user_json(user) do
    %{id: user.id,
      username: user.username,
      password_hash: user.password_hash,
      password: user.password}
  end
end