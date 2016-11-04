module Rollr
  class LowDropper < Dropper
    def ordered
      rolls.sort { |a, b| b <=> a }
    end
  end
end
