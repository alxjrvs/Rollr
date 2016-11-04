module Randsum
  class Dropper < Filter

    def self.dropper_for(quantity:,extremity:, rolls:)
      Object.const_get(
        "Randsum::#{extremity.to_s.gsub("est","").capitalize}Dropper"
      ).new(quantity: quantity, rolls: rolls)
    end

    def filter
      ordered.first(remainder)
    end

    def ordered
      raise NotImplementedError
    end

    def remainder
      rolls.length - quantity
    end

  end
end
