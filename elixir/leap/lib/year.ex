defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    case {rem(year, 400), rem(year, 100), rem(year, 4)} do
      {0, _, _} -> true
      {_, 0, _} -> false
      {_, _, 0} -> true
      _ -> false
    end
  end
end
