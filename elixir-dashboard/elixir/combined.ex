defmodule Combined do
  def height_to_mph(meters) do
    Convert.mps_to_mph(Drop.fall_velocity(meters))
  end

  def height_to_mph_pipe(meters) do
    Drop.fall_velocity(meters) |> Convert.mps_to_mph
  end
end
