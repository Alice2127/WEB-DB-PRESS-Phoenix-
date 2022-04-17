defmodule Realworld.Blogs.Article do
  use Ecto.Schema
  import Ecto.Changeset

  alias Realworld.Blogs.Comment #追加
  alias Realworld.Blogs.Tag #追加
  alias Realworld.Blogs.ArticleTag #追加
  alias Realworld.Accounts.User #追加

  schema "articles" do
    field :body, :string
    field :title, :string
    #追加

    belongs_to :author, User #追加

    has_many :comments, Comment, on_delete: :delete_all

    many_to_many :tags, Tag, #追加
    join_through: ArticleTag, #追加
    on_replace: :delete, #追加
    on_delete: :delete_all #追加
    timestamps()
  end

  @doc false
  def changeset(article, attrs, tags \\ []) do #tags
    article
    #author_idを追加
    |> cast(attrs, [:title, :body, :author_id])
    |> validate_required([:title, :body, :author_id])
    |> put_assoc(:tags, tags) #追加
  end
end
