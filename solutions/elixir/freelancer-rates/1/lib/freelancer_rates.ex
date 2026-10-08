defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    rate = hourly_rate * 8
    :erlang.float(rate)
  end

  def apply_discount(before_discount, discount) do
    actual_discount = before_discount * (discount / 100)
    :erlang.float(before_discount - actual_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    rate = apply_discount(22 * daily_rate(hourly_rate), discount)
    ceil(rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    cost = monthly_rate(hourly_rate, discount)
    costs_per_day = cost / 22
    Float.floor(budget / costs_per_day, 1)
  end
end
