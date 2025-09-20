module Rps
  class Player
    attr_reader :name

    COMP_CHOICE_MAP = {
      1 => :rock,
      2 => :paper,
      3 => :scissors
  }.freeze

    def initialize(name)
      @name = name
      @history = []
    end

    def pick()
      raise "#{self.class} must implement the method #{__method__}."
    end

    def record(round)
      @history << round
    end
  end
end