class NumberGame
  def initialize(max)
    @max = max
  end
  def start
    puts "Guess a number between 1 and #{@max}"
    result = rand(@max) + 1
    3.times do
      input = gets.to_i
      if result == input
        puts "Congratulations! You guessed correctly!"
        return
      else
        puts "Sorry! Your guess was too #{input > result ? 'high' : 'low'}!"
      end
    end
    puts "The correct answer was #{result}!"
  end
end

game = NumberGame.new(10)
game.start
