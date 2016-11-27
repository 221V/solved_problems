defmodule Task do

  def wsd(count, values) do
    wsd(count, values, [])
  end

  defp wsd(_, [], result) do
    Enum.reverse(result)
  end

  defp wsd(count, [head_value|tail_values], result) do
    size = String.length(Integer.to_string(head_value))
    res1 = w_sd(head_value, size)
    wsd(count - 1, tail_values, [Integer.to_string(res1)|result])
  end

  defp w_sd(a, s) do
    w_sd(a, s, 0)
  end

  defp w_sd(0, _, res) do
    res
  end
  
  defp w_sd(a, _, res) when a < 10 do
    res + a * 1
  end
  
  defp w_sd(a, s, res) do
    res1 = Kernel.rem(a, 10) * s
    w_sd(Kernel.div(a, 10), s - 1, res + res1)
  end

end
