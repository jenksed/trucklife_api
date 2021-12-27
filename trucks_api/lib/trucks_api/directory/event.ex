defmodule TrucksApi.Directory.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :description, :string
    field :end_date, :date
    field :end_time, :time
    field :event_id, :integer
    field :name, :string
    field :start_date, :date
    field :start_time, :time
    field :tags, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:event_id, :name, :description, :start_date, :end_date, :start_time, :end_time, :tags])
    |> validate_required([:event_id, :name, :description, :start_date, :end_date, :start_time, :end_time, :tags])
    |> unique_constraint(:event_id)
  end
end
