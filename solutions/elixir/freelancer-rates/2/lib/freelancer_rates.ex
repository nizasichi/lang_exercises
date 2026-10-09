defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate),
    do: :erlang.float(hourly_rate * @hours_per_day)

  def apply_discount(before_discount, discount),
    do: :erlang.float(before_discount - before_discount * (discount / 100))

  def monthly_rate(hourly_rate, discount),
    do:
      hourly_rate
      |> daily_rate()
      |> Kernel.*(@billable_days_per_month)
      |> apply_discount(discount)
      |> ceil()

  def days_in_budget(budget, hourly_rate, discount),
    do:
      hourly_rate
      |> monthly_rate(discount)
      |> Kernel./(@billable_days_per_month)
      |> then(fn costs_per_day -> budget / costs_per_day end)
      |> Float.floor(1)
end
