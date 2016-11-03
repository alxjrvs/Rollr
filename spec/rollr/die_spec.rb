require 'spec_helper'
require 'securerandom'

describe Rollr::Die do
  let(:sides)  { 20 }
  let(:die)    { Rollr::Die.new(sides) }

  before do
  end

  describe ".roll" do
    let(:weighted_die_roll) { 20 }
    let(:result)            { die.roll }

    before do
      allow(SecureRandom).to receive(:random_number) do
        weighted_die_roll  - Rollr::Die::ZERO_INDEX_FIXER
      end
    end
    it 'returns a random number from SecureRandom constrained to the number of sides on the die' do
      expect(result.to_i).to eq weighted_die_roll
    end
  end
end
