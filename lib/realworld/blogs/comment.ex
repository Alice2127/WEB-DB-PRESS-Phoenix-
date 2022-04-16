defmodule Realworld.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Realworld.Blogs.Article #追加

  schema "comments" do
    field :body, :string
    belongs_to :article, Article #変更

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :article_id]) #変更
    |> validate_required([:body, :article_id]) #変更
  end
end
