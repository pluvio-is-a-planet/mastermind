require_relative 'game_logic'
require_relative 'display'
require_relative 'text_output'

class Cpu
  include Display
  include GameLogic
  include TextOutput

  def initialize
    @key = set_code
  end

  def game
    puts 'Your key has been created, the computer will now attempt to guess the key>>'
    play_game
    game_over
  end

  private

  def set_code
    result = gets.chomp
    return result if result.match(/^[1-6]{4}$/)

    put messages('input error')
    set_code
  end

  def computer_guess
  end
end
