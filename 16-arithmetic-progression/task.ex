defmodule Task do

  def ar_pr(count, values) do
    ar_pr(count, values, [])
  end

  defp ar_pr(_, [], result) do
    Enum.reverse(result)
  end

  defp ar_pr(count, [{v1, v2, v3}|tail_values], result) do
    res1 = sum_pr(v3, v1, v2, 0)
    ar_pr(count - 1, tail_values, [Integer.to_string(res1)|result])
  end

  defp sum_pr(0, _, _, sum) do
    sum
  end
  
  defp sum_pr(count, begin, step, sum) do
    if count > 1 do
      sum_pr(count - 1, begin, step, sum + (begin + step * (count - 1)))
    else
      sum_pr(count - 1, begin, step, sum + begin)
    end
  end

end
