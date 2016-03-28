module Rollr
  class RollResult
    attr_accessor :rolls

    def initialize(sides:, rolls:)
      @sides = sides
      @rolls = rolls
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
  end 
end
