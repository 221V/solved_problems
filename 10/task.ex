defmodule Task do

  def median3(count, values) do
    median3(count, values, [])
  end

  defp median3(_, [], result) do
    Enum.reverse(result)
  end

  defp median3(count, [head_value|tail_values], result) do
    {value1, value2, value3} = head_value
    value_median = median_3(value1, value2, value3)
    median3(count - 1, tail_values, [value_median|result])
  end
  
  defp median_3(a,b,c) when (a < b and a > c) or (a > b and a < c), do: a
  defp median_3(a,b,c) when (b < a and b > c) or (b > a and b < c), do: b
  defp median_3(a,b,c) when (c < a and c > b) or (c > a and c < b), do: c
  defp median_3(_,_,_), do: nil

end
