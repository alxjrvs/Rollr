module Randsum
  class RollReport

    def initialize(roll)
      @roll = roll
    end

    def to_i
      total
    end

    def sides
      die.sides
    end

    def die
      roll.die
    end

    def rolls
      @_rolls ||= roll.result
    end

    def total
      @_total ||= rolls.inject(:+)
    end

    def quantity
      @_quantity ||= rolls.count
    end

    def drop(quantity:, extremity:)
      return RollReport.new(
        roll.drop(quantity: quantity, extremity: extremity)
      )
    end

    def drop_lowest(quantity = 1)
      return RollReport.new(
        roll.drop(quantity: quantity, extremity: :lowest)
      )
    end

    def drop_highest(quantity = 1)
      return RollReport.new(
        roll.drop(quantity: quantity, extremity: :highest)
      )
    end

    private
    attr_reader :roll
  end
end
