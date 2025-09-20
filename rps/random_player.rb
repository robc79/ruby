require_relative 'player'

module Rps
  class RandomPlayer < Player
    def initialize(name)
      super
      @prng = Random.new()
    end
  
    def pick()
      choice = @prng.rand(1..3)
      COMP_CHOICE_MAP[choice]
    end
  
    def record(round)
      super
    end
  end
end
