require_relative 'sequence_error'
require_relative 'rna'
require_relative 'nucleotide'

module Rosalind
  class DnaSequence < GeneticSequence
    include Nucleotide

    def initialize(sequence)
      super(sequence, "ACGT")
    end

    def to_rna
      rna = @sequence.gsub('T', 'U')
      RnaSequence.new(rna)
    end

    def reverse_compliment
      compliment_map = {
        'A' => 'T',
        'T' => 'A',
        'C' => 'G',
        'G' => 'C'
      }.freeze

      compliment = ""
      
      @sequence.each_char do |nucleotide|
        compliment << compliment_map[nucleotide]        
      end

      DnaSequence.new(compliment.reverse)
    end
  end
end
