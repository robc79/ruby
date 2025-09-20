require_relative 'player'

module Rps
  class TrigramPlayer < Player
    BEATEN_BY = {
      :rock => :paper,
      :paper => :scissors,
      :scissors => :rock
  }.freeze

    def initialize(name)
      super
      @prng = Random.new()
      @trigrams = {}
    end

    def pick
      if @history.length < 4
        choice = @prng.rand(1..3)
        mapped_choice = COMP_CHOICE_MAP[choice]
      else
        sequence = @history.map { |entry| entry.p2_choice }
        current_trigram = sequence[-4..-2]
        previous_choices = @trigrams[current_trigram]
        if previous_choices.length > 1
          idx = @prng.rand(0..previous_choices.length-1)
          mapped_choice = previous_choices[idx]
        else
          mapped_choice = previous_choices[0]
        end
      end

      BEATEN_BY[mapped_choice]
    end

    def record(round)
      super
      round_num = @history.length
      
      if round_num > 3
        sequence = @history.map { |entry| entry.p2_choice }
        trigram = sequence[-4..-2]
        choice = sequence[-1]
        if !@trigrams.key? trigram
          @trigrams[trigram] = []
        end
        if !@trigrams[trigram].include?(choice)
          @trigrams[trigram] << choice
        end
      end
    end
  end
end