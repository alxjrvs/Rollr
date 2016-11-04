require 'spec_helper'

describe Rollr::RollReport do
  let(:sides)  { 6 }
  let(:die)    { Rollr::Die.new(sides) }
  let(:rolls)  { [2, 6, 5] }
  let(:roll)   { Rollr::Roll.new(result: rolls, die: die, quantity: 3) }

  let(:report) do
    Rollr::RollReport.new(roll)
  end

  let(:total) { rolls.inject(:+) }

  describe "#to_i" do
    it 'returns the total of the array of dice' do
      expect(report.to_i).to eq total
    end
  end

  describe "#total" do
    it 'returns the total of the array of dice' do
      total = rolls.inject(:+)
      expect(report.total).to eq total
    end
  end

  describe "#drop" do
    let(:num) { 2 }
    let(:dropped_result) { report.drop(quantity: num, extremity: extremity)}

    describe "given a 'lowest' extremity" do
      let(:extremity) { :lowest }

      it "removes n lowest dice values" do
        expect(dropped_result.rolls).to match_array [6]
        expect(dropped_result.total).to eq 6
      end

      it "returns a RollReport" do
        expect(dropped_result).to be_a Rollr::RollReport
      end
    end
    describe "given a 'highest' extremity" do
      let(:extremity) { :highest }

      it "removes n highest dice values" do
        expect(dropped_result.rolls).to match_array [2]
        expect(dropped_result.total).to eq 2
      end

      it "returns a RollReport" do
        expect(dropped_result).to be_a Rollr::RollReport
      end
    end
  end

  describe "#drop_highest" do
    describe "with an argument n" do
      let(:num) { 2 }
      let(:dropped_result) { report.drop_highest(num)}
      it "removes n highest dice values" do
        expect(dropped_result.rolls).to match_array [2]
        expect(dropped_result.total).to eq 2
      end

      it "returns a RollReport" do
        expect(dropped_result).to be_a Rollr::RollReport
      end
    end

    describe "with no argument" do
      let(:dropped_result) { report.drop_highest }
      it "removes the highest dice value" do
        expect(dropped_result.rolls).to match_array [2, 5]
        expect(dropped_result.total).to eq 7
      end

      it "returns a RollReport" do
        expect(dropped_result).to be_a Rollr::RollReport
      end
    end
  end

  describe "#drop_lowest" do
    describe "with an argument n" do
      let(:num) { 2 }
      let(:dropped_result) { report.drop_lowest(num)}
      it "removes n lowest dice values" do
        expect(dropped_result.rolls).to match_array [6]
        expect(dropped_result.total).to eq 6
      end

      it "returns a RollReport" do
        expect(report.drop_lowest(num)).to be_a Rollr::RollReport
      end
    end

    describe "with no argument" do
      let(:dropped_result) { report.drop_lowest }
      it "removes the lowest dice value" do
        expect(dropped_result.rolls).to match_array [5, 6]
        expect(dropped_result.total).to eq 11
      end

      it "returns a RollReport" do
        expect(report.drop_lowest).to be_a Rollr::RollReport
      end
    end
  end

  describe "#rolls" do
    it 'returns the array of dice roll results' do
      expect(report.rolls).to eq rolls
    end
  end

  describe "#quantity" do
    let(:quantity) { rolls.count }

    it 'returns the number of dice rolled' do
      expect(report.quantity).to eq quantity
    end
  end

  describe "#die" do
    it 'returns a die object with the correct sides' do
      expect(report.die).to be_a Rollr::Die
      expect(report.die.sides).to eq 6
    end
  end
end
