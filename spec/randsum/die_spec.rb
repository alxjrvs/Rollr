require 'spec_helper'

describe Randsum::Die do
  let(:die)    { Randsum::Die.new(20, randomizer: AlwaysWhatYouGiveIt) }

  let(:desired_result) { quantity * die.sides  }

  describe "#simple_roll" do
    let(:quantity) { 1 }
    let(:roll)   { die.simple_roll }

    it 'returns a plausibly random number constrained to the number of sides on the die' do
      expect(roll.to_i).to eq desired_result
    end

    it  'it returns a Fixnum' do
      expect(roll).to be_a Fixnum
    end
  end

  describe "#roll(n)" do
    let(:quantity) { 3 }
    let(:roll)   { die.roll(quantity) }
    it 'returns a plausibly random number constrained to the number of sides on the die' do
      expect(roll.to_i).to eq desired_result
    end

    it  'it returns a Randsum::RollReport' do
      expect(roll).to be_a Randsum::RollReport
    end
  end
end
