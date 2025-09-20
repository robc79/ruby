require_relative 'player'

module Rps
  class HumanPlayer < Player
    USER_CHOICE_MAP = {
      'r' => :rock,
      'p' => :paper,
      's' => :scissors
  }.freeze
  
    def initialize(name)
      super
    end
  
    def pick()
      choice = ""
  
      while not ['r', 'p', 's'].include?(choice)
        puts("(r)ock, (p)aper, or (s)cissors? ")
        choice = gets().strip()
      end
  
      return USER_CHOICE_MAP[choice]
    end
  
    def record(round)
      super
    end
  end
end
