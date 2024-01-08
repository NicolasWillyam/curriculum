# stack.ex
defmodule Stack do
  @moduledoc """
  A simple stack implementation in Elixir.
  """

  defstruct stack: []

  @doc """
  Starts the stack with an empty state.

  ## Examples

      iex> Stack.start_link()
      {:ok, %Stack{stack: []}}
  """
  def start_link do
    {:ok, %Stack{}}
  end

  @doc """
  Removes one element from the stack.

  ## Examples

      iex> stack = %Stack{stack: [1, 2, 3]}
      iex> Stack.pop(stack)
      {:ok, {1, %Stack{stack: [2, 3]}}}
  """
  def pop(%Stack{stack: []} = stack), do: {:error, :empty_stack}
  def pop(%Stack{stack: [top | rest]} = stack), do: {:ok, {top, %Stack{stack: rest}}}

  @doc """
  Adds an element to the stack.

  ## Examples

      iex> stack = %Stack{stack: [1, 2]}
      iex> Stack.push(stack, 3)
      {:ok, %Stack{stack: [3, 1, 2]}}
  """
  def push(%Stack{stack: stack} = stack, element) do
    {:ok, %Stack{stack: [element | stack]}}
  end
end
