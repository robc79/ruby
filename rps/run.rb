require_relative 'game'
require_relative 'human_player'
require_relative 'trigram_player'

if __FILE__ == $0
  print "Enter your name: "
  p1_name = gets.chomp
  p1 = Rps::HumanPlayer.new(p1_name)
  p2 = Rps::TrigramPlayer.new("CPU")
  g = Rps::Game.new(p1, p2)
  
  count = nil
  
  while (count == nil || count < 0)
    print "How many rounds to play? "
    raw_count = gets.chomp
    count = Integer(raw_count, exception: false)
  end
  
  g.play_game(count)
end