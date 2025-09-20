module Rosalind
  class Protein < GeneticSequence
    def initialize(sequence)
      super(sequence, "ACDEFGHIKLMNPQRSTVWY")
    end
  end
end
