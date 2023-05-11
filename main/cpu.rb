require_relative 'game_logic'
require_relative 'display'
require_relative 'text_output'

class Cpu
  include Display
  include GameLogic
  include TextOutput

  ALL_POSSIBILITIES = (1111..6666).select do |num|
    test = num
    all_digits_less_than_seven = true

    while test > 0
      digit = test % 10
      if digit <= 0 || digit >= 7
        all_digits_less_than_seven = false
        break
      end
      test /= 10
    end

    num.to_s if all_digits_less_than_seven
  end

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

  def five_guess

  end
end
