defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end

  def preparation_time_in_minutes(num_of_layers) do
    num_of_layers * 2
  end

  def total_time_in_minutes(num_of_layers, duration_in_oven) do
    preparation_time_in_minutes(num_of_layers) + duration_in_oven
  end

  def alarm() do
    "Ding!"
  end
end
