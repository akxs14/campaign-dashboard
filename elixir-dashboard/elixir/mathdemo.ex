defmodule MathDemo do
  def abs(number) when number < 0 do
    -number
  end

  def abs(0) do
    0
  end

  def abs(number) do
    number
  end
end
