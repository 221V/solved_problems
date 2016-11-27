defmodule Task do

  def d_roll(count, values) do
    d_roll(count, values, [])
  end

  defp d_roll(_, [], result) do
    Enum.reverse(result)
  end

  defp d_roll(count, [head_value|tail_values], result) do
    res1 = Kernel.trunc(head_value * 6) + 1
    d_roll(count - 1, tail_values, [res1|result])
  end

end
