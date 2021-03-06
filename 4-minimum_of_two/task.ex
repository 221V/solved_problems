defmodule Task do

  def min2(count, values) do
    min2(count, values, [])
  end

  defp min2(_, [], result) do
    Enum.reverse(result)
  end

  defp min2(count, [{value1, value2}|tail_values], result) do
    value3 = case value1 < value2 do
      true -> value1
      false -> value2
    end
    min2(count - 1, tail_values, [value3|result])
  end

end
