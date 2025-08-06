defmodule TakeANumber do
  def start() do
    spawn(fn -> TakeANumber.listen() end)
  end

  def listen(state \\ 0) do
    receive do
      :stop ->
        exit(:normal)

      {:report_state, pid} ->
        (fn pid ->
           send(pid, state)
           listen(state)
         end).(pid)

      {:take_a_number, pid} ->
        (fn pid ->
           send(pid, state + 1)
           listen(state + 1)
         end).(pid)

      _ ->
        listen(state)
    end
  end
end

# TakeANumber.start()
