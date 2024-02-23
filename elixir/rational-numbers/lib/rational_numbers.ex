defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2}
    |> reduce
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1}
    |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    case {num < 0, den < 0} do
      {true, false} -> {num * -1, den} |> reduce
      {true, true} -> {num * -1, den * -1} |> reduce
      {false, true} -> {num, den * -1} |> reduce
      _ -> {num, den} |> reduce
    end
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n < 0 do
    {den ** -n, num ** -n}
    |> reduce
  end

  def pow_rational({num, den}, n) do
    {num ** n, den ** n}
    |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}) do
    x ** (num/den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    greatest_common_denominator = Integer.gcd(a, b)
    {a / greatest_common_denominator, b / greatest_common_denominator}
    |> normalize
  end

  @doc """
  Normalize a negative ratio
  """
  @spec normalize(a :: rational) :: rational
  def normalize({num, den}) do
    if den < 0 do
      {num * -1, den * -1}
    else
      {num, den}
    end
  end
end
