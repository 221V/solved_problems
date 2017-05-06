defmodule Task do

  def min3(count, values) do
    min3(count, values, [])
  end

  defp min3(_, [], result) do
    Enum.reverse(result)
  end

  defp min3(count, [{value1, value2, value3}|tail_values], result) do
    value_min = mini3(value1, value2, value3)
    min3(count - 1, tail_values, [value_min|result])
  end
  
  defp mini3(a,b,c) when a < b and a < c, do: a
  defp mini3(a,b,c) when b < a and b < c, do: b
  defp mini3(a,b,c) when c < a and c < b, do: c
  defp mini3(_,_,_), do: 0

end
