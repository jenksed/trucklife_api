defmodule TrucksApi.DirectoryTest do
  use TrucksApi.DataCase

  alias TrucksApi.Directory

  describe "events" do
    alias TrucksApi.Directory.Event

    import TrucksApi.DirectoryFixtures

    @invalid_attrs %{description: nil, end_date: nil, end_time: nil, event_id: nil, name: nil, start_date: nil, start_time: nil, tags: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Directory.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Directory.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{description: "some description", end_date: ~D[2021-12-26], end_time: ~T[14:00:00], event_id: 42, name: "some name", start_date: ~D[2021-12-26], start_time: ~T[14:00:00], tags: []}

      assert {:ok, %Event{} = event} = Directory.create_event(valid_attrs)
      assert event.description == "some description"
      assert event.end_date == ~D[2021-12-26]
      assert event.end_time == ~T[14:00:00]
      assert event.event_id == 42
      assert event.name == "some name"
      assert event.start_date == ~D[2021-12-26]
      assert event.start_time == ~T[14:00:00]
      assert event.tags == []
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{description: "some updated description", end_date: ~D[2021-12-27], end_time: ~T[15:01:01], event_id: 43, name: "some updated name", start_date: ~D[2021-12-27], start_time: ~T[15:01:01], tags: []}

      assert {:ok, %Event{} = event} = Directory.update_event(event, update_attrs)
      assert event.description == "some updated description"
      assert event.end_date == ~D[2021-12-27]
      assert event.end_time == ~T[15:01:01]
      assert event.event_id == 43
      assert event.name == "some updated name"
      assert event.start_date == ~D[2021-12-27]
      assert event.start_time == ~T[15:01:01]
      assert event.tags == []
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_event(event, @invalid_attrs)
      assert event == Directory.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Directory.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Directory.change_event(event)
    end
  end
end
