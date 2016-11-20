defmodule Task do

  def maxmin(values) do
    [value_head|_] = values
    maxmin(values, value_head, value_head)
  end

  defp maxmin([], max, min) do
    [max|[min]]
  end

  defp maxmin([head_value|tail_values], max, min) do
    max = case max > head_value do
      true -> max
      false -> head_value
    end
    min = case min < head_value do
      true -> min
      false -> head_value
    end
    maxmin(tail_values, max, min)
  end

end
