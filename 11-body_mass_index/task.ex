defmodule Task do

  def bmIndex(count, values) do
    bmIndex(count, values, [])
  end

  defp bmIndex(_, [], result) do
    Enum.reverse(result)
  end

  defp bmIndex(count, [head_value|tail_values], result) do
    {value1, value2} = head_value
    value_median = bm_Index(Kernel.round(value1 / (value2 * value2) * 10) / 10)
    bmIndex(count - 1, tail_values, [value_median|result])
  end
  
  defp bm_Index(a) when a < 18.5, do: "under"
  defp bm_Index(a) when a < 25.0 and a >= 18.5, do: "normal"
  defp bm_Index(a) when a < 30.0 and a >= 25.0, do: "over"
  defp bm_Index(_), do: "fat"

end
