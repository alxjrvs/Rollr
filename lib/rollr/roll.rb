module Rollr
  class Roll
    ZERO_INDEX_FIXER = 1
    attr_reader :die, :quantity, :sides

    def initialize(die:, quantity:, result: nil)
      @die = die
      @quantity = quantity
      @randomizer = die.randomizer
      @sides = die.sides
      @result = result
    end

    def drop(quantity:,extremity:)
      return Roll.new(
        die: die,
        quantity: quantity,
        result: Dropper.dropper_for(
          quantity: quantity,
          extremity: extremity,
          rolls: result
        ).filter
      )
    end

    def result
      @result ||= (1..quantity).map { single_roll }
    end

    private
    attr_reader :randomizer

    def single_roll
      randomizer.random_number(sides).to_i + ZERO_INDEX_FIXER
    end
  end
end
