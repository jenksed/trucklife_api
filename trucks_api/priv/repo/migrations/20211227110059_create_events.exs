defmodule TrucksApi.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_id, :integer
      add :name, :string
      add :description, :text
      add :start_date, :date
      add :end_date, :date
      add :start_time, :time
      add :end_time, :time
      add :tags, {:array, :string}

      timestamps()
    end

    create unique_index(:events, [:event_id])
  end
end
