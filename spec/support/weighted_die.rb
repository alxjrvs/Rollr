class WeightedDie
  attr_reader :sides

  def initialize(result)
    @sides = result
  end

  def roll
    sides
  end
end
