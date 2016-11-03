require 'securerandom'

module Rollr
  class Die
    attr_reader :sides

    ZERO_INDEX_FIXER = 1

    def initialize(sides)
      @sides = sides
    end

    def roll
      SecureRandom.random_number(sides).to_i + ZERO_INDEX_FIXER
    end
  end
end
