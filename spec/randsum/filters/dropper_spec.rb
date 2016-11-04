require 'spec_helper'

describe Randsum::Dropper do
  let(:dropper) { Randsum::Dropper.new(quantity: :foo, rolls: []) }

  describe "#ordered" do
    it 'raises a NotImplementedError' do
      expect{ dropper.ordered }.to raise_error NotImplementedError
    end
  end

  describe "#filter" do
    it 'raises a NotImplementedError' do
      expect{ dropper.filter }.to raise_error NotImplementedError
    end
  end
end
