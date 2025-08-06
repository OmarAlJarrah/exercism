defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    reduce({a1 * b2 + a2 * b1, b1 * b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    reduce({a1 * b2 - a2 * b1, b1 * b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    reduce({a1 * b2, a2 * b1})
  end

@doc """
  Absolute value of a rational number
  """
  @spec abs(a:: rational):: rational
  def abs({a, b}) do
    reduce({Kernel.abs(a), Kernel.abs(b)}) # Reduce the absolute value
  end

@doc """
  Exponentiation of a rational number by an integer
  """
@spec pow_rational(a:: rational, n:: integer):: rational
def pow_rational({a, b}, n) when n >= 0 do
  reduce({Integer.pow(a, n), Integer.pow(b, n)})
end

def pow_rational({a, b}, n) do
  # For negative numbers raised to odd negative powers, 
  # the sign should be opposite of the original number's sign
  sign = if a < 0 and rem(n, 2) != 0, do: -1, else: 1
  
  # Work with absolute values for the calculation
  a_abs = Kernel.abs(a)
  reduced = reduce({Integer.pow(b, -n), Integer.pow(a_abs, -n)})
  {num, den} = reduced
  {sign * num, den}
end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    cond do
      a == 0 -> 1.0
      a < 0 -> 1.0 / :math.pow(x, -a / b)
      true -> :math.pow(x, a / b)
    end
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a1, a2}) do
    g = Integer.gcd(a1, a2)
    a = div(a1, g)
    b = div(a2, g)

    if b < 0 do
      {-a, -b}
    else
      {a, b}
    end
  end
end