defmodule TrucksApiWeb.EventControllerTest do
  use TrucksApiWeb.ConnCase

  import TrucksApi.DirectoryFixtures

  alias TrucksApi.Directory.Event

  @create_attrs %{
    description: "some description",
    end_date: ~D[2021-12-26],
    end_time: ~T[14:00:00],
    event_id: 42,
    name: "some name",
    start_date: ~D[2021-12-26],
    start_time: ~T[14:00:00],
    tags: []
  }
  @update_attrs %{
    description: "some updated description",
    end_date: ~D[2021-12-27],
    end_time: ~T[15:01:01],
    event_id: 43,
    name: "some updated name",
    start_date: ~D[2021-12-27],
    start_time: ~T[15:01:01],
    tags: []
  }
  @invalid_attrs %{description: nil, end_date: nil, end_time: nil, event_id: nil, name: nil, start_date: nil, start_time: nil, tags: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "end_date" => "2021-12-26",
               "end_time" => "14:00:00",
               "event_id" => 42,
               "name" => "some name",
               "start_date" => "2021-12-26",
               "start_time" => "14:00:00",
               "tags" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.event_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "end_date" => "2021-12-27",
               "end_time" => "15:01:01",
               "event_id" => 43,
               "name" => "some updated name",
               "start_date" => "2021-12-27",
               "start_time" => "15:01:01",
               "tags" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, Routes.event_path(conn, :delete, event))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.event_path(conn, :show, event))
      end
    end
  end

  defp create_event(_) do
    event = event_fixture()
    %{event: event}
  end
end
