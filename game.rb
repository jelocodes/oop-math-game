require './player'
require './turn'

class MathGame
  attr_accessor :player_1, :player_2
  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @round = 1
  end

  def start_game
    while (@player_1.lives != 0 && @player_2.lives != 0)
      t = Turn.new
      t.play(@round, @player_1, @player_2)
      @round = @round == 1 ? 2 : 1
    end
    puts "game over"
  end
end