require_relative 'sequence_error'
require_relative 'nucleotide'
require_relative 'protein'

module Rosalind
  class RnaSequence < GeneticSequence
    include Nucleotide

    CODON_MAP = {
      'UUU' => 'F',
      'CUU' => 'L',
      'AUU' => 'I',
      'GUU' => 'V',
      'UUC' => 'F',
      'CUC' => 'L',
      'AUC' => 'I',
      'GUC' => 'V',
      'UUA' => 'L',
      'CUA' => 'L',
      'AUA' => 'I',
      'GUA' => 'V',
      'UUG' => 'L',
      'CUG' => 'L',
      'AUG' => 'M',
      'GUG' => 'V',
      'UCU' => 'S',
      'CCU' => 'P',
      'ACU' => 'T',
      'GCU' => 'A',
      'UCC' => 'S',
      'CCC' => 'P',
      'ACC' => 'T',
      'GCC' => 'A',
      'UCA' => 'S',
      'CCA' => 'P',
      'ACA' => 'T',
      'GCA' => 'A',
      'UCG' => 'S',
      'CCG' => 'P',
      'ACG' => 'T',
      'GCG' => 'A',
      'UAU' => 'Y',
      'CAU' => 'H',
      'AAU' => 'N',
      'GAU' => 'D',
      'UAC' => 'Y',
      'CAC' => 'H',
      'AAC' => 'N',
      'GAC' => 'D',
      'UAA' => nil,
      'CAA' => 'Q',
      'AAA' => 'K',
      'GAA' => 'E',
      'UAG' => nil,
      'CAG' => 'Q',
      'AAG' => 'K',
      'GAG' => 'E',
      'UGU' => 'C',
      'CGU' => 'R',
      'AGU' => 'S',
      'GGU' => 'G',
      'UGC' => 'C',
      'CGC' => 'R',
      'AGC' => 'S',
      'GGC' => 'G',
      'UGA' => nil,
      'CGA' => 'R',
      'AGA' => 'R',
      'GGA' => 'G',
      'UGG' => 'W',
      'CGG' => 'R',
      'AGG' => 'R',
      'GGG' => 'G'
    }.freeze

    def initialize(sequence)
      super(sequence, "ACGU")
    end

    def to_protein
      protein_sequence = ""
      
      (0...@sequence.length).step(3).each do |idx|
        codon = @sequence[idx...idx+3]
        protein = CODON_MAP[codon]
        
        if protein != nil
          protein_sequence << protein
        else
          break
        end
      end

      Protein.new(protein_sequence)
    end
  end
end
