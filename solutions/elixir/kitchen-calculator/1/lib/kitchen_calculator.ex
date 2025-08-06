defmodule KitchenCalculator do
  @units %{
    :ml => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume({_, num}) do
    num
  end

  def to_milliliter({us, num}) do
    num * Map.get(@units, us)
  end

  def from_milliliter({_, num}, unit) do
    num / Map.get(@units, unit)
  end

  def convert(volume_pair, unit) do
    from_milliliter({nil, to_milliliter(volume_pair)}, unit)
  end
end
