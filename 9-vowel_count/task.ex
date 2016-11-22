defmodule Task do

  def vc(count, values) do
    vc(count, values, [], "aouiey")
  end

  defp vc(_, [], result, _) do
    Enum.reverse(result)
  end

  defp vc(count, [head_value|tail_values], result, symbols) do
    vc(count - 1, tail_values, [Kernel.length(for << char  <- head_value >>, String.contains?(symbols, <<char>>), do: true)|result], symbols)
  end

end
