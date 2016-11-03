require 'spec_helper'
require 'support/weighted_die'

describe Rollr::Roller do
  let(:quantity) { 5 }
  let(:die)      { WeightedDie.new(result: 20) }
  let(:roller)   do
    Rollr::Roller.new(
      quantity: quantity,
      die: die
    )
  end

  describe ".roll" do
    let(:desired_result) { quantity * die.roll }
    let(:result) { roller.roll }

    it 'returns the desired result' do
      expect(result.to_i).to eq desired_result
    end

    it 'returns a Roller::RollResult' do
      expect(result).to be_a Rollr::RollResult
    end
  end
end
