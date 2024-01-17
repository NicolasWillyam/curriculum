defmodule CounterWeb.CounterController do
  use CounterWeb, :controller

  def count(conn, params) do
    render(conn, :count, count: params["count"] || 0)
  end

  def increment(conn, params) do
    current_count = String.to_integer(params["count"])
    increment_by = String.to_integer(params["increment_by"])
    render(conn, :count, count: current_count + increment_by)
  end
end
