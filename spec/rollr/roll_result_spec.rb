require 'spec_helper'

describe Rollr::RollResult do
  let(:sides)  { 6 }
  let(:rolls)  { [2, 6, 5] }

  let(:result) do
    Rollr::RollResult.new(
      sides: sides,
      rolls: rolls
    )
  end

  describe "#to_i" do
    it 'returns the total of the array of dice' do
      total = rolls.inject(:+)
      expect(result.total).to eq total
    end
  end
  
  describe "#total" do
    it 'returns the total of the array of dice' do
      total = rolls.inject(:+)
      expect(result.to_i).to eq total
    end
  end

  describe "#drop_highest" do
    describe "with an argument n" do
      let(:num) { 2 }
      let(:dropped_result) { result.drop_highest(num)}
      it "removes n highest dice values" do
        expect(dropped_result.rolls).to match_array [2]
        expect(dropped_result.total).to eq 2
      end

      it "returns a RollResult" do
        expect(dropped_result).to be_a Rollr::RollResult
      end
    end

    describe "with no argument" do
      let(:dropped_result) { result.drop_highest }
      it "removes the highest dice value" do
        expect(dropped_result.rolls).to match_array [2, 5]
        expect(dropped_result.total).to eq 7
      end

      it "returns a RollResult" do
        expect(dropped_result).to be_a Rollr::RollResult
      end
    end
  end

  describe "#drop_lowest" do
    describe "with an argument n" do
      let(:num) { 2 }
      let(:dropped_result) { result.drop_lowest(num)}
      it "removes n lowest dice values" do
        expect(dropped_result.rolls).to match_array [6]
        expect(dropped_result.total).to eq 6
      end

      it "returns a RollResult" do
        expect(result.drop_lowest(num)).to be_a Rollr::RollResult
      end
    end

    describe "with no argument" do
      let(:dropped_result) { result.drop_lowest }
      it "removes the lowest dice value" do
        expect(dropped_result.rolls).to match_array [5, 6]
        expect(dropped_result.total).to eq 11
      end

      it "returns a RollResult" do
        expect(result.drop_lowest).to be_a Rollr::RollResult
      end
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
