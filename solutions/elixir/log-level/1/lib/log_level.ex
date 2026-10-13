defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 ->
        cond do
          legacy? == true -> :unknown
          true -> :trace
        end

      level == 1 ->
        :debug

      level == 2 ->
        :info

      level == 3 ->
        :warning

      level == 4 ->
        :error

      level == 5 ->
        cond do
          legacy? == true -> :unknown
          true -> :fatal
        end

      true ->
        :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    log_label = to_label(level, legacy?)

    cond do
      log_label == :error ->
        :ops

      log_label == :fatal ->
        :ops

      log_label == :unknown ->
        cond do
          legacy? -> :dev1
          true -> :dev2
        end

      true ->
        false
    end
  end
end
