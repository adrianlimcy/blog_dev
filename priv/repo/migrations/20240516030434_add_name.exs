defmodule Blog.Repo.Migrations.AddName do
  use Ecto.Migration

  def change do
    # create table(:users) do
    alter table(:users) do
      add :name, :string
      # add :username, :string
    end
    # create(unique_index(:user, [:username]))
  end
end
