defmodule Blog.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Comments.Comment

  schema "stories" do
    field :title, :string
    field :body, :string
    # field :user_id, :id
    belongs_to :user, Blog.Accounts.User
    has_many :comments, Comment, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body])
  end
end
