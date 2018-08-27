defmodule TravisPlaygroundTest do
  use ExUnit.Case
  doctest TravisPlayground

  test "greets the world" do
    assert TravisPlayground.hello() == :world
  end
end
