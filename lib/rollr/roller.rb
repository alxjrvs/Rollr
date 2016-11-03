module Rollr
  class Roller
    attr_reader :die, :quantity

    def initialize(quantity: 1, die:)
      @quantity = quantity
      @die = die
    end

    def roll
      Rollr::RollResult.new(
        rolls: rolls,
        sides: die.sides
      )
    end

    private

    def rolls
      (1..quantity).map { die.roll }
    end
  end
end
