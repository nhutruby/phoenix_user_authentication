defmodule PhoenixUserAuthenticationWeb.UserView do
  use PhoenixUserAuthenticationWeb, :view
  alias PhoenixUserAuthenticationWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      password_hash: user.password_hash,
      password: user.password}
  end
end
