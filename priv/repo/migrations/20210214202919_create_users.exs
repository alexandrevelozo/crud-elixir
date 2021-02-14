defmodule Hello.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :description, :text

      timestamps()
    end

  end
end
