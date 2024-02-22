defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end

  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end

  def from_milliliter(volume_pair, :milliliter) do
    volume_pair
  end

  def from_milliliter({_, volume}, :cup) do
    {:cup, volume / 240}
  end

  def from_milliliter({_, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / 30}
  end

  def from_milliliter({_, volume}, :teaspoon) do
    {:teaspoon, volume / 5}
  end

  def from_milliliter({_, volume}, :tablespoon) do
    {:tablespoon, volume / 15}
  end

  def convert({origin, volume}, target) do
    milliliters_pair = to_milliliter({origin, volume})  
    from_milliliter(milliliters_pair, target)
  end

end
