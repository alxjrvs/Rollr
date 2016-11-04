module Rollr
  class RollReport
    attr_reader :rolls

    def initialize(sides:, rolls:)
      @sides = sides
      @rolls = rolls
    end

    def to_i
      total
    end

    def die
      Die.new(sides)
    end

    def total
      @_total ||= rolls.inject(:+)
    end

    def quantity
      @_number_of_dice ||= rolls.count
    end

    def drop(quantity:, extremity:)
      new_report(quantity: quantity, drop: extremity)
    end

    def drop_lowest(quantity = 1)
      new_report(quantity: quantity, drop: :lowest)
    end

    def drop_highest(quantity = 1)
      new_report(quantity: quantity, drop: :highest)
    end

    private
    attr_reader :sides

    def new_report(quantity:, drop:)
      return RollReport.new(
        sides: sides,
        rolls: ( Dropper.
          dropper_for(
            quantity: quantity,
            extremity: drop,
            rolls: rolls
          ).filter
        )
      )
    end
  end
end
