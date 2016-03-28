require 'spec_helper'

describe Rollr::RollResult do
  let(:sides)  { 6 } 
  let(:rolls)  { [2, 6, 6] }

  let(:result) do 
    Rollr::RollResult.new(
      sides: sides, 
      rolls: rolls
    )
  end

  describe "#total" do
    it 'returns the total of the array of dice' do
      total = rolls.inject(:+)
      expect(result.total).to eq total
    end
  end

  describe "#rolls" do
    it 'returns the array of dice roll results' do
      expect(result.rolls).to eq rolls
    end
  end

  describe "#number_of_dice" do
    it 'returns the number of dice rolled' do
      number = rolls.count
      expect(result.number_of_dice).to eq number
    end
  end

  describe "#die_sides" do
    it 'returns the number of sides of the dice rolled' do
      expect(result.die_sides).to eq sides
    end
  end
end
