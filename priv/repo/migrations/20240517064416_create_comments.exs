defmodule Blog.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :message, :text
      add :story_id, references(:stories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:comments, [:story_id])
  end
end
