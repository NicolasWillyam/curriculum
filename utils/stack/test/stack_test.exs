# stack_test.exs

defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "start_link/0 - default state" do
    {:ok, stack} = Stack.start_link()
    assert %Stack{} == stack
  end

  test "pop/1 - remove one element from stack" do
    stack = %Stack{stack: [1, 2, 3]}
    {:ok, {1, new_stack}} = Stack.pop(stack)
    assert %Stack{stack: [2, 3]} == new_stack
  end

  test "pop/1 - remove element from empty stack" do
    stack = %Stack{stack: []}
    assert {:error, :empty_stack} == Stack.pop(stack)
  end

  test "push/2 - add element to empty stack" do
    stack = %Stack{stack: []}
    {:ok, new_stack} = Stack.push(stack, 1)
    assert %Stack{stack: [1]} == new_stack
  end

  test "push/2 - add element to stack with multiple elements" do
    stack = %Stack{stack: [1, 2]}
    {:ok, new_stack} = Stack.push(stack, 3)
    assert %Stack{stack: [3, 1, 2]} == new_stack
  end
end
