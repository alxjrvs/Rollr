require 'securerandom'

module Rollr
  class Die
    attr_accessor :sides, :randomizer

    def initialize(sides, randomizer: SecureRandom)
      @sides = sides
      @randomizer = randomizer
    end

    def roll(quantity = 1)
      Rollr::RollReport.new(
        Rollr::Roll.new(
          quantity: quantity,
          die: self
        )
      )
    end

    private

  end
end
