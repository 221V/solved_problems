defmodule Task do

  def sum2(count, values) do
    sum2(count, String.split(values, " "), 0)
  end

  def sum2(_, [], result) do
    result
  end

  def sum2(count, [head_value|tail_values], result) do
    sum2(count - 1, tail_values, result + String.to_integer(head_value))
  end

end
