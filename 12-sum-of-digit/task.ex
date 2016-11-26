defmodule Task do

  def sum_digit(count, values) do
    sum_digit(count, values, [])
  end

  defp sum_digit(_, [], result) do
    Enum.reverse(result)
  end

  defp sum_digit(count, [head_value|tail_values], result) do
    {value1, value2, value3} = head_value
    res1 = Enum.sum(Integer.digits(value1 * value2 + value3))
    sum_digit(count - 1, tail_values, [res1|result])
  end

end
