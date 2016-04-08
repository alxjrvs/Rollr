require 'securerandom'

module Rollr
  class Die
    attr_accessor :sides, :rolls

    def initialize(sides)
      @sides = sides
    end 

    def roll(number: 1)
      Rollr::RollResult.new(
        rolls: array_of_rolls(number),
        sides: sides
      )
    end 

    private

    def single_roll
      SecureRandom.random_number(sides) + 1
    end

    def array_of_rolls(number)
      (1..number).map { single_roll }
    end
  end 
end
