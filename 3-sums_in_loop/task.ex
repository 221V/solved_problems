defmodule Task do

  def sum3(count, values) do
    sum3(count, values, [])
  end

  defp sum3(_, [], result) do
    Enum.reverse(result)
  end

  defp sum3(count, [head_value|tail_values], result) do
    {value1, value2} = head_value
    value3 = value1 + value2
    sum3(count - 1, tail_values, [value3|result])
  end

end
