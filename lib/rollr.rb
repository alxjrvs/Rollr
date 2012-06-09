# Rollr Simulates rolling dice of different size.
#
# @author Alex Jarvis

require 'rubygems'

module Rollr


  # Represents a single instance of the result of a die
  #
  class Die


    # @attribute sides [Integer] The number of sides the die has
    #
    attr_accessor :sides

    # New instance of Dice.
    #
    # @param [Integer] sides
    # @return [Object] Die object
    #
    def initialize(sides)
      @sides = sides
    end #initialize

    # Roll a new die.
    #
    # @param [Integer] count
    # @return [Object] integer
    #
    def roll(count)
      (1..count).map { |d| rand(self.sides) + 1 }.inject(0) { |total, d| total += d }
    end #roll

  end #Die


  #Die Constants

  D3 = Die.new(3)
  D4 = Die.new(4)
  D6 = Die.new(6)
  D8 = Die.new(8)
  D10= Die.new(10)
  D12 = Die.new(12)
  D20 = Die.new(20)

end #Rollr


