
require 'rubygems'

module Rollr

  class Die
    attr_accessor :sides, :rolls

    def initialize(sides)
      @sides = sides
      @rolls = []
    end #initialize

    def roll(count=1)
      individual_rolls = (1..count).map { |d| rand(self.sides) + 1 }
      @rolls << DiceRoll.new(individual_rolls, self.sides, count)
      @rolls.last.total
    end #roll
    
    def roll_drop_lowest(count=1, drop_die = 0)
      individual_rolls = (1..count).map { |d| rand(self.sides) + 1 }.sort.drop(drop_die)
      @rolls << DiceRoll.new(individual_rolls, self.sides, count)
      @rolls.last.total
    end #roll_drop_lowest
  end #Die

  class DiceRoll
    attr_accessor :each_die, :total, :dice_sides, :number_of_dice

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


