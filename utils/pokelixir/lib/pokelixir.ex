defmodule Pokelixir do
  @moduledoc """
  Documentation for `Pokelixir`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pokelixir.hello()
      :world

  """
  def hello do
    :world
  end

  alias Pokelixir.Pokemon

  @base_url "https://pokeapi.co/api/v2/pokemon/"

  def get(name) do
    url = @base_url <> name

    case fetch_pokemon_data(url) do
      {:ok, data} ->
        Pokemon.new(parse_pokemon_data(data))

      {:error, _reason} ->
        # Handle error accordingly, for now, returning an empty Pokemon struct
        Pokemon.new(%{})
    end
  end

  defp fetch_pokemon_data(url) do
    case Finch.get(url) do
      {:ok, %{body: body}} ->
        {:ok, body}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp parse_pokemon_data(body) do
    # Implement your own parsing logic based on the actual API response
    # For simplicity, let's assume the API response is in JSON format
    # and contains the required fields for a Pokemon struct
    Jason.decode!(body)
  end
end
