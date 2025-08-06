defmodule TakeANumber do
  def start() do
    spawn(&listen/0)
  end

  def listen(state \\ 0) do
    receive do
      :stop ->
        exit(:normal)

      {:report_state, pid} ->
        inner_func(pid, state)

      {:take_a_number, pid} ->
        inner_func(pid, state + 1)

      _ ->
        listen(state)
    end
  end

  def inner_func(pid, state) do
    send(pid, state)
    listen(state)
  end
end

# TakeANumber.start()
