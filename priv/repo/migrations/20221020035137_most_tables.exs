defmodule ChatTest.Repo.Migrations.MostTables do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";", "")


    create table(:users , primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :first_name, :text, null: false
      add :last_name, :text, null: false
      add :email, :text, null: false
      add :username, :text, null: false
      add :password, :text, null: false
      add :jid, :text
      timestamps()
    end
  end
end
