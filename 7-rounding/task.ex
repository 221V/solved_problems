defmodule Task do

  def round(count, values) do
    round(count, values, [])
  end

  defp round(_, [], result) do
    Enum.reverse(result)
  end

  defp round(count, [{value1, value2}|tail_values], result) do
    round(count - 1, tail_values, [Kernel.round(value1 / value2)|result])
  end

end
