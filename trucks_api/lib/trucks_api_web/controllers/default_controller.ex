defmodule TrucksApi.DefaultController do
  use TrucksApi.Web, :controller

  def index(conn, _params) do
    text conn, "TruckLife API!"
  end
end