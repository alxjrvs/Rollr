require 'securerandom'

module Rollr
  class Die
    attr_accessor :sides, :rolls

    def initialize(sides)
      @sides = sides
    end

    def roll(num = 1)
      Rollr::RollResult.new(
        rolls: rolls(num),
        sides: sides
      )
    end

    private

    def single_roll
      SecureRandom.random_number(sides).to_i + 1
    end

    def rolls(number)
      (1..number).map { single_roll }
    end
  end
end
