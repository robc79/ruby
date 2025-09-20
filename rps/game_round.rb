module Rps
  class GameRound
    attr_reader :p1_choice, :p2_choice, :outcome

    def initialize(p1_choice, p2_choice, outcome)
      @p1_choice = p1_choice
      @p2_choice = p2_choice
      @outcome = outcome
    end

    def to_s
      "#{@p1_choice} vs #{@p2_choice} resulted in #{@outcome}"
    end
  end
end