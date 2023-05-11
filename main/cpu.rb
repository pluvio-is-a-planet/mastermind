require_relative 'game_logic'
require_relative 'display'
require_relative '../text/text_output'

class Cpu
  attr_accessor :key, :guess

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

  def play_game
    (1..12).each do |n|
      puts messages('cpu think')
      sleep 2
      @guess = computer_guess
      show_code(guess)
      puts ''
      break if solved?(key, guess)

      guess_result
    end
  end

  def set_code
    result = gets.chomp
    return result.split('') if result.match(/^[1-6]{4}$/)

    put messages('input error')
    set_code
  end

  def guess_result
    evaluate_guess(key, guess)
    show_clues(@exact_matches, @half_matches)
  end

  def game_over
    if solved?(key, guess)
      puts messages('cpu wins')
    else
      print messages('user loses')
      show_code(key)
      puts ''
    end
    # prompt the user to play again
  end

  def computer_guess
    five_guess
  end

  def five_guess
    @guess = '1122'
    # play
  end
end
