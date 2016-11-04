module Randsum
  class HighDropper < Dropper
    def ordered
      rolls.sort { |a, b| a <=> b }
    end
  end
end
