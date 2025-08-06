defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(value) do
    40 - value
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, mins) do
    (mins) + preparation_time_in_minutes(layers)
  end


  # Please define the 'alarm/0' function
  def alarm do
    "Ding!"
  end
end
