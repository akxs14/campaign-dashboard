defmodule Drop do
  def fall_velocity_simple(distance) do
    :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity(distance, gravity \\ 9.8) do
    :math.sqrt(2 * gravity * distance)
  end
end
