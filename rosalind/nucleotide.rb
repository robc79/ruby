require_relative 'sequence_error'

module Rosalind
  module Nucleotide
    def count_a
      @sequence.count('A')
    end

    def count_c
      @sequence.count('C')
    end

    def count_t
      @sequence.count('T')
    end

    def count_g
      @sequence.count('G')
    end

    def count_u
      @sequence.count('U')
    end

    def percentage_gc
      (count_g + count_c) / Float(@sequence.length)
    end

    def point_mutations(comparison)
      if comparison.sequence.length != @sequence.length
        raise SequenceError, "Supplied sequence is a different length."
      end
      
      count = 0

      @sequence.each_char.with_index do |source_nucleotide, idx|
        comparison_nucleotide = comparison.sequence[idx]
        count += 1 if source_nucleotide != comparison_nucleotide
      end

      count
    end
  end
end