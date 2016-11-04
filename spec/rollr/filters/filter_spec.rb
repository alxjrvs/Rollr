require 'spec_helper'

describe Rollr::Filter do
  let(:filter) { Rollr::Filter.new(quantity: :foo, rolls: []) }

  describe "#filter" do
    it 'raises a NotImplementedError' do
      expect{ filter.filter }.to raise_error NotImplementedError
    end
  end
end
