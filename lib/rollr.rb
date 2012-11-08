# Rollr Simulates rolling dice of different size.
#
# In its most recent version, it also supports a kind of primitive logging,
# which can track the rolls made to the die over time, as well as the individual
# results of rolls within a pool of rolls (so, for instance, if you rolled 20
# 6 six sided die, you could see the result of each individual roll of each
# die.
#
# @author Alex Jarvis

require 'rubygems'

module Rollr


  # Represents a single instance of a die
  #
  class Die


    # @attribute sides [Integer] The number of sides the die has
    #
    attr_accessor :sides, :rolls

    # New instance of Die
    #
    # @param [Integer] sides
    # @return [Object] Die object
    #
    def initialize(sides)
      @sides = sides
      @rolls = []
    end #initialize

    # Roll a new die. This creates a DiceRoll Object, and adds it to the array of rolls from this Die. 
    # Then, return the total of that Roll.
    #
    # @param [Integer] count
    # @return [Integer] The result of the rolls, by way of a DiceRoll object.
    #
    def roll(count=1)
      individual_rolls = (1..count).map { |d| rand(self.sides) + 1 }
      @rolls << DiceRoll.new(individual_rolls, self.sides, count)
      @rolls.last.total
    end #roll

    # Roll a new die. This creates a DiceRoll Object, and adds it to the array of rolls from this Die. 
    # Then, drop the lowest number of die rolls equal to the second argument
    # Then, return the total of that Roll.
    #
    # @param [Integer] count
    # @param [Integer] drop_die
    # @return [Integer] The result of the rolls, by way of a DiceRoll object.
    #
    def roll_drop_lowest(count=1, drop_die = 0)
      individual_rolls = (1..count).map { |d| rand(self.sides) + 1 }.sort.drop(drop_die)
      @rolls << DiceRoll.new(individual_rolls, self.sides, count)
      @rolls.last.total
    end #roll_drop_lowest
  end #Die

  #DiceRoll is a class that holds information regarding a single instance of a rolled die.
  #
  class DiceRoll

    # @attribute each_side [Array] the individual result of a single roll of a die.
    # @attribute total [Integer] the combined total of the individual rolls
    # @attribute dice_sides [Integer] the number of sides the rolled die had
    # @attribute number_of_dice [Integer] the number of dice rolled.
    # 
    attr_accessor :each_die, :total, :dice_sides, :number_of_dice


    # New instance of DiceRoll
    #
    # @param [Array] individual
    # @param [Integer] sides
    # @param [Integer] number
    # @return [Object] Die object
    #
    def initialize(individual, sides, number)
      @each_die = individual
      @dice_sides = sides
      @number_of_dice = number
      @total = individual.inject(0) { |total, d| total += d }
    end #initialize

  end #DiceRoll
  #Die Constants

  D3 = Die.new(3)
  D4 = Die.new(4)
  D6 = Die.new(6)
  D8 = Die.new(8)
  D10= Die.new(10)
  D12 = Die.new(12)
  D20 = Die.new(20)

end #Rollr


