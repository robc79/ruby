require_relative 'game_round'

module Rps
  class Game
    GAME_STATES = {
      [:rock, :paper] => :lose,
      [:rock, :scissors] => :win,
      [:rock, :rock] => :draw,
      [:paper, :paper] => :draw,
      [:paper, :scissors] => :lose,
      [:paper, :rock] => :win,
      [:scissors, :paper] => :win,
      [:scissors, :scissors] => :draw,
      [:scissors, :rock] => :lose,
  }.freeze
  
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end
  
    def play_game(rounds=100)
      puts "#{@p1.name} vs #{@p2.name}"
      results = []
      
      rounds.times do
        result = play_round(@p1, @p2)
        results << result

        if result == :none
          puts "Draw!"
        elsif result == :player1
          puts "#{@p1.name} won"
        else
          puts "#{@p2.name} won"
        end
      end
    
      p1_total = results.select { |elem| elem == :player1 }.count
      p2_total = results.select { |elem| elem == :player2 }.count
      draw_total = results.length - (p1_total + p2_total)
      total = Float(results.length)
    
      puts("")
      puts("#{@p1.name}: #{(p1_total / total) * 100}%")
      puts("#{@p2.name}: #{(p2_total / total) * 100}%")
      puts("draw: #{(draw_total / total) * 100}%")
    end
  
    private def play_round(p1, p2)
      p1_choice = p1.pick()
      p2_choice = p2.pick()
      puts "#{p1_choice} vs #{p2_choice}"
      p1_outcome = GAME_STATES[[p1_choice, p2_choice]]
      p2_outcome = GAME_STATES[[p2_choice, p1_choice]]
      p1.record(GameRound.new(p1_choice, p2_choice, p1_outcome))
      p2.record(GameRound.new(p2_choice, p1_choice, p2_outcome))
      winner = :none
      
      if p1_outcome == :win
        winner = :player1
      elsif p2_outcome == :win
        winner = :player2
      end
    
      return winner
    end
  end    
end
