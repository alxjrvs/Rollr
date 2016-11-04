require 'spec_helper'

describe Randsum do
  it 'has a version number' do
    expect(Randsum::VERSION).not_to be nil
  end

  describe "Die Size Constants" do

    it "has a D20" do
      expect(Randsum::D20).to be_a Randsum::Die
    end

    it "has a D12" do
      expect(Randsum::D12).to be_a Randsum::Die
    end

    it "has a D10" do
      expect(Randsum::D10).to be_a Randsum::Die
    end

    it "has a D8" do
      expect(Randsum::D8).to be_a Randsum::Die
    end

    it "has a D6" do
      expect(Randsum::D6).to be_a Randsum::Die
    end

    it "has a D4" do
      expect(Randsum::D4).to be_a Randsum::Die
    end

    it "has a D3" do
      expect(Randsum::D3).to be_a Randsum::Die
    end

    it "has a D2" do
      expect(Randsum::D2).to be_a Randsum::Die
    end
  end
end
