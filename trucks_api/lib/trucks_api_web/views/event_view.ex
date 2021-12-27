defmodule TrucksApi.EventView do
  use TrucksApi.Web, :view
  alias TrucksApi.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      id: event.id,
      event_id: event.event_id,
      name: event.name,
      description: event.description,
      start_date: event.start_date,
      end_date: event.end_date,
      start_time: event.start_time,
      end_time: event.end_time,
      tags: event.tags
    }
  end
end
