require 'spec_helper'

describe Rollr do
  it 'has a version number' do
    expect(Rollr::VERSION).not_to be nil
  end

  describe "Die Size Constants" do

    it "has a D20" do
      expect(Rollr::D20).to be_a Rollr::Die
    end

    it "has a D12" do
      expect(Rollr::D12).to be_a Rollr::Die
    end

    it "has a D10" do
      expect(Rollr::D10).to be_a Rollr::Die
    end

    it "has a D8" do
      expect(Rollr::D8).to be_a Rollr::Die
    end

    it "has a D6" do
      expect(Rollr::D6).to be_a Rollr::Die
    end

    it "has a D4" do
      expect(Rollr::D4).to be_a Rollr::Die
    end

    it "has a D3" do
      expect(Rollr::D3).to be_a Rollr::Die
    end

    it "has a D2" do
      expect(Rollr::D2).to be_a Rollr::Die
    end
  end
end
