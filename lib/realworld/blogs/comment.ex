defmodule Realworld.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Realworld.Blogs.Article #追加
  alias Realworld.Accounts.User #追加

  schema "comments" do
    field :body, :string
    belongs_to :article, Article #変更
    belongs_to :author, User #追加

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    #:author_idを追加
    |> cast(attrs, [:body, :article_id, :author_id]) #変更
    |> validate_required([:body, :article_id, :author_id]) #変更
  end
end
