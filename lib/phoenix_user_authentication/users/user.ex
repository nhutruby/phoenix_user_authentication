defmodule PhoenixUserAuthentication.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Argon2

  schema "users" do
    field :password, :string
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> validate_length(:password, min: 6, max: 100)
    |> put_password_hash()
  end
  
  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end
  
  defp put_password_hash(changeset), do: changeset
end
