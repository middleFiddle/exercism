defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """

  @spec score(position) :: integer
  def score({x, y}) do
    radius = :math.sqrt(x * x + y * y)
    case {radius > 10, radius > 5, radius > 1} do
      {true, _, _} -> 0
      {_, true, _} -> 1
      {_, _, true} -> 5
      _ -> 10
    end
  end
end
