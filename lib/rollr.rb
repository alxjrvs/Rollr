require "rollr/version"
require "rollr/filters/filter"
require "rollr/filters/droppers/dropper"
require "rollr/filters/droppers/high_dropper"
require "rollr/filters/droppers/low_dropper"
require "rollr/die"
require "rollr/roll_report"

module Rollr

  D2 = Die.new(2)
  D3 = Die.new(3)
  D4 = Die.new(4)
  D6 = Die.new(6)
  D8 = Die.new(8)
  D10= Die.new(10)
  D12 = Die.new(12)
  D20 = Die.new(20)

end
