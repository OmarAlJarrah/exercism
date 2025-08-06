defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ nil) do
    new_score =
      cond do
        score == nil -> 0
        true -> score
      end

    IO.puts(new_score)
    Map.put(scores, name, new_score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  def update_score(scores, name, score) do
    original = Map.get(scores, name, 0)
    Map.put(scores, name, original + score)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
