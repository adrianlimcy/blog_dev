defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :message, :string
    # field :story_id, :id
    belongs_to :story, Blog.Stories.Story
    belongs_to :user, Blog.Accounts.User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message, :story_id, :user_id])
    |> validate_required([:message, :story_id])
  end
end
