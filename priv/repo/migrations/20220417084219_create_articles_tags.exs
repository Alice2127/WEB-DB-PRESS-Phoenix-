defmodule Realworld.Repo.Migrations.CreateArticlesTags do
  use Ecto.Migration

  def change do
    # primary_key: falseを追加
    create table(:articles_tags, primary_key: false) do
      # null: falseを追加
      add :article_id, references(:articles, on_delete: :nothing), null: false
      # null: falseを追加
      add :tag_id, references(:tags, on_delete: :nothing), null: false

      # timestamps()を削除
    end

    create index(:articles_tags, [:article_id])
    create index(:articles_tags, [:tag_id])
  end
end
