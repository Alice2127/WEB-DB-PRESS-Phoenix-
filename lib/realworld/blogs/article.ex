defmodule Realworld.Blogs.Article do
  use Ecto.Schema
  import Ecto.Changeset

  # 追加
  alias Realworld.Blogs.Comment
  # 追加
  alias Realworld.Blogs.Tag
  # 追加
  alias Realworld.Blogs.ArticleTag
  # 追加
  alias Realworld.Accounts.User

  schema "articles" do
    field :body, :string
    field :title, :string
    # 追加

    # 追加
    belongs_to :author, User

    has_many :comments, Comment, on_delete: :delete_all

    # 追加
    many_to_many :tags, Tag,
      # 追加
      join_through: ArticleTag,
      # 追加
      on_replace: :delete,
      # 追加
      on_delete: :delete_all

    timestamps()
  end

  @doc false
  # tags
  def changeset(article, attrs, tags \\ []) do
    article
    # author_idを追加
    |> cast(attrs, [:title, :body, :author_id])
    |> validate_required([:title, :body, :author_id])
    # 追加
    |> put_assoc(:tags, tags)
  end
end
