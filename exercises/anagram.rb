# Anagram checker for two strings supplied on the command line.

def remove_char!(char, char_list)
  idx = char_list.index(char)
  return false if idx == nil
  char_list.delete_at(idx)
  true
end

def is_anagram?(word_one, word_two)
  return false if word_one.size != word_two.size
  return false if word_one == word_two
  
  word_two_chars = word_two.chars
  matches = false

  word_one.each_char do |c|
    matches = remove_char!(c, word_two_chars)
    break if !matches
  end
  
  matches
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.size != 2
   STDERR.puts "Usage: anagram string_1 string_2" 
  end
  
  word_one = ARGV[0]
  word_two = ARGV[1]
  
  if is_anagram?(word_one, word_two)
    puts "'#{word_one}' and '#{word_two}' are anagrams."
  else
    puts "'#{word_one}' and '#{word_two}' are not anagrams."
  end
end