defmodule TrucksApi.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrucksApi.Directory` context.
  """

  @doc """
  Generate a unique event event_id.
  """
  def unique_event_event_id, do: System.unique_integer([:positive])

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~D[2021-12-26],
        end_time: ~T[14:00:00],
        event_id: unique_event_event_id(),
        name: "some name",
        start_date: ~D[2021-12-26],
        start_time: ~T[14:00:00],
        tags: []
      })
      |> TrucksApi.Directory.create_event()

    event
  end
end
