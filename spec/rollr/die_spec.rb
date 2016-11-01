require 'spec_helper'
require 'securerandom'

describe Rollr::Die do
  describe "#roll" do
    let(:sides)  { 6 }
    let(:die)    { Rollr::Die.new(sides) }

    let(:number) { 3 }
    let(:roll)   { die.roll(number) }

    it 'returns a random number from SecureRandom constrained to the number of sides on the die' do
      expect(SecureRandom).to receive(:random_number).with(sides)
      die.roll
    end

    describe 'returns a Rollr::RollResult' do
      it 'every time' do
        expect(roll).to be_a Rollr::RollResult
      end

      it 'with an accurate number of dice' do
        expect(roll.number_of_dice).to eq number
      end

      it 'with an accurate die sides' do
        expect(roll.die_sides).to eq sides
      end
    end
  end
end
