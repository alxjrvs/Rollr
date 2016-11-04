module Rollr
  class Filter
    attr_reader :quantity, :rolls

    def initialize(quantity:, rolls:)
      @quantity = quantity
      @rolls = rolls
    end

    def filter
      raise NotImplementedError
    end
  end
end
