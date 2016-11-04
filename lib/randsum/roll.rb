module Randsum
  class Roll
    attr_reader :die, :quantity, :sides, :result

    def initialize(die:, quantity:, result: nil)
      @die = die
      @quantity = quantity
      @sides = die.sides
      @result = result || roll!
    end

    def drop(quantity:,extremity:)
      return new_roll_with(
      result: Dropper.dropper_for(
          quantity: quantity,
          extremity: extremity,
          rolls: result
        ).filter
      )
    end

    private
    def new_roll_with(result:)
      return Roll.new(
        die: die,
        quantity: quantity,
        result: result
      )
    end

    def roll!
      (1..quantity).map { die.simple_roll }
    end
  end
end
