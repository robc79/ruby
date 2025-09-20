module Rosalind
  class GeneticSequence
    attr_reader :sequence

    def initialize(sequence, alphabet)
      pattern = /^[#{alphabet.upcase}]*$/
      
      if !sequence.upcase.match? pattern
        raise SequenceError, "Invalid characters detected."
      end
      
      @sequence = sequence.upcase
    end
  end
end