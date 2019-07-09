class Turn
  attr_accessor :answer, :number1, :number2

  def initialize
    @number1 = (1..20).to_a.sample
    @number2 = (1..20).to_a.sample
  end

  def play(round, player1, player2)
    puts "Player #{round}: What does #{number1} plus #{number2} equal?"
    input = gets.chomp
    case
      when input.to_i == (@number1 + @number2)
        puts "YES! You are correct."
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        round = round == 1 ? 2 : 1
        puts "----- NEW TURN -----"
      when input.to_i != (@number1 + @number2)
        puts "Seriously? No!"
        round == 1 ? player1.lives -= 1 : player2.lives -= 1
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        round = round == 1 ? 2 : 1
        puts "----- NEW TURN -----"
    end
  end
end