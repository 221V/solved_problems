defmodule Task do

  def f_to_c(count, values) do
    f_to_c(count, values, [])
  end

  defp f_to_c(_, [], result) do
    Enum.reverse(result)
  end

  defp f_to_c(count, [head_value|tail_values], result) do
    f_to_c(count - 1, tail_values, [Kernel.round((5/9) * (head_value - 32))|result])
  end
  
  def c_to_f(count, values) do
    c_to_f(count, values, [])
  end

  defp c_to_f(_, [], result) do
    Enum.reverse(result)
  end

  defp c_to_f(count, [head_value|tail_values], result) do
    c_to_f(count - 1, tail_values, [Kernel.round(((9/5) * head_value) + 32)|result])
  end

end
