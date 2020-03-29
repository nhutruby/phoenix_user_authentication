defmodule PhoenixUserAuthenticationWeb.SessionController do
    use PhoenixUserAuthenticationWeb, :controller
    alias PhoenixUserAuthentication.Users
    alias PhoenixUserAuthentication.Users.Guardian
    require Logger
    
    def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
      Users.authenticate_user(username, password)
      |> login_reply(conn)
    end
  
    def logout(conn, _) do
      conn
      |> Guardian.Plug.sign_out() #This module's full name is Auth.UserManager.Guardian.Plug,
      
    end                           #docs are not applicable here
  
    defp login_reply({:ok, user}, conn) do
      Logger.info("aaaaaaaaaaaaaaaaaaa")
      conn
      |> render("show.json", user: user)
  
        #This module's full name is Auth.UserManager.Guardian.Plug,   #and the arguments specified in the Guardian.Plug.sign_in()
    end                                #docs are not applicable here.
  
    defp login_reply({:error, reason}, conn) do
      Logger.info('error')
    end
  end