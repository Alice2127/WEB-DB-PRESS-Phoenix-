defmodule Realworld.Blogs.ArticleTag do
  use Ecto.Schema
  import Ecto.Changeset

  # 追加
  alias Realworld.Blogs.Article
  # 追加
  alias Realworld.Blogs.Tag

  # 追加
  @primary_key false
  schema "articles_tags" do
    # 変更
    belongs_to :article, Article
    # 変更
    belongs_to :tag, Tag
    # timestamps()を削除
  end

  @doc false
  def changeset(article_tag, attrs) do
    article_tag
    # 変更
    |> cast(attrs, [:tag_id, :article_id])
    # 変更
    |> validate_required([:tag_id, :article_id])
  end
end
