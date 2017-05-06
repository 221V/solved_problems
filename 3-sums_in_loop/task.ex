defmodule Task do

  def sum3(count, values) do
    sum3(count, values, [])
  end

  defp sum3(_, [], result) do
    Enum.reverse(result)
  end

  defp sum3(count, [{value1, value2}|tail_values], result) do
    sum3(count - 1, tail_values, [value1 + value2|result])
  end

end
