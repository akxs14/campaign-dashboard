defmodule Drop do
  @moduledoc """
  Functions calculating velocities achieved by objects dropped in a vacuum.
  from *Introducing Elixir*, O'Reilly Media, Inc., 2014.
  Copyright 2014 by Simon St.Laurent and J. David Eisenberg.
  """

  @vsn 0.1

  def fall_velocity_simple(distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  @doc """
  Calculates the velocity of an object falling on Earth
  as if it were in a vacuum (no air resistance). The distance is
  the height from which the object falls, specified in meters,
  and the function returns a velocity in meters per second.
  """
  @spec fall_velocity_default(number()) :: number()

  def fall_velocity_default(distance, gravity \\ 9.8) when distance >= 0 do
    :math.sqrt(2 * gravity * distance)
  end

  def fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  def fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end

  def fall_velocity_tuple({:earth, distance}) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity_tuple({:moon, distance}) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  def fall_velocity_tuple({:mars, distance}) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end
