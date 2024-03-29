defmodule CounterWeb.PageController do
  use CounterWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def count(conn, _params) do
    render(conn, :count, count: 0)
  end
end
