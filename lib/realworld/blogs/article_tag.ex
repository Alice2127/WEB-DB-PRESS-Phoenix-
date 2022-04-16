defmodule Realworld.Blogs.ArticleTag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Realworld.Blogs.Article #追加
  alias Realworld.Blogs.Tag #追加

  @primary_key false #追加
  schema "articles_tags" do
    belongs_to :article, Article #変更
    belongs_to :tag, Tag #変更
  end

  @doc false
  def changeset(article_tag, attrs) do
    article_tag
    |> cast(attrs, [:tag_id, :article_id]) #変更
    |> validate_required([:tag_id, :article_id]) #変更
  end
end
