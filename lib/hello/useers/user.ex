defmodule Hello.Useers.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :description, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :description])
    |> validate_required([:name, :email, :description])
  end
end
