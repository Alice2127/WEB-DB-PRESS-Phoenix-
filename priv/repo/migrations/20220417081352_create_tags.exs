defmodule Realworld.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, :string, null: false #null: false を追加

      timestamps()
    end

    create unique_index(:tags, [:tag])
  end
end
