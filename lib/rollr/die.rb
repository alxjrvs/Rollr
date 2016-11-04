require 'securerandom'

module Rollr
  class Die
    ZERO_INDEX_FIXER = 1
    attr_accessor :sides, :rolls, :randomizer

    def initialize(sides, randomizer: SecureRandom)
      @sides = sides
      @randomizer = randomizer
    end

    def roll(num = 1)
      Rollr::RollReport.new(
        rolls: rolls(num),
        sides: sides
      )
    end

    private

    def single_roll
      randomizer.random_number(sides).to_i + ZERO_INDEX_FIXER
    end

    def rolls(number)
      (1..number).map { single_roll }
    end
  end
end
