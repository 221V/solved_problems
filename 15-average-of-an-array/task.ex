defmodule Task do

  def avg(count, values) do
    avg(count, values, [])
  end

  defp avg(_, [], result) do
    Enum.reverse(result)
  end

  defp avg(count, [head_value|tail_values], result) do
    res1 = avg_(head_value, 0, 0)
    avg(count - 1, tail_values, [Integer.to_string(res1)|result])
  end

  defp avg_([], count, sum) do
    Kernel.round(sum / count)
  end
  
  defp avg_(a, _, res) when a < 10 do
    res + a * 1
  end
  
  defp avg_([head|tail], count, sum) do
    avg_(tail, count + 1, sum + head)
  end

end
