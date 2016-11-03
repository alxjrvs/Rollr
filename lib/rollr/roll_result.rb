module Rollr
  class RollResult
    attr_accessor :rolls, :sides

    def initialize(sides:, rolls:)
      @sides = sides
      @rolls = rolls
    end

    def to_i
      total
    end

    def die_sides
      @sides
    end

    def total
      @_total ||= rolls.inject(:+)
    end

    def number_of_dice
      @_number_of_dice ||= rolls.count
    end

    def drop_lowest(num = 1)
      return RollResult.new(
        sides: sides,
        rolls: sorted_rolls.last(rolls.length - num)
      )
    end

    def drop_highest(num = 1)
      return RollResult.new(
        sides: sides,
        rolls: sorted_rolls.first(rolls.length - num)
      )
    end

    private

    def sorted_rolls
      rolls.sort
    end
  end
end
