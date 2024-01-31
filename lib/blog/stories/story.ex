defmodule Blog.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :title, :string
    field :body, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
