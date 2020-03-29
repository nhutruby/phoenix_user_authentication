defmodule PhoenixUserAuthenticationWeb.Router do
  use PhoenixUserAuthenticationWeb, :router
  alias PhoenixUserAuthentication
  alias PhoenixUserAuthentication.Users
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixUserAuthenticationWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
  end
  pipeline :auth do
    plug PhoenixUserAuthentication.Users.Pipeline, error_handler: PhoenixUserAuthentication.Users.ErrorHandler
  end
  
  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end
  # Other scopes may use custom stacks.
  scope "/api", PhoenixUserAuthenticationWeb do
     pipe_through [:api, :auth]

     get "/users", UserController, :index
     post "/users", UserController, :create
     get "/users/:id", UserController, :show
     post "/sessions", SessionController, :login # login
     get "/sessions", SessionController, :logout # log out
  end
end
