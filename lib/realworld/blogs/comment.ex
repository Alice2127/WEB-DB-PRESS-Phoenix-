defmodule Realworld.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  # 追加
  alias Realworld.Blogs.Article
  # 追加
  alias Realworld.Accounts.User

  schema "comments" do
    field :body, :string
    # 変更
    belongs_to :article, Article
    # 追加
    belongs_to :author, User

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    # :author_idを追加
    # 変更
    |> cast(attrs, [:body, :article_id, :author_id])
    # 変更
    |> validate_required([:body, :article_id, :author_id])
  end
end
