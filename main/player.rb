require_relative 'game_logic'
require_relative 'display'
require_relative '../text/text_output'

class Player
  attr_accessor :exact_matches, :half_matches
  attr_reader :key, :guess

  include Display
  include GameLogic
  include TextOutput

  def initialize
    @key = random_key
  end

  def game
    puts 'The key has been generated, time to make the first guess>>'
    play_game
    game_over
  end

  private

  def random_key
    (1..4).map { OPTIONS.sample }
  end

  def player_guess
    result = gets.chomp
    return result if result.match(/^[1-6]{4}$/)
    return result if EXIT_KEYS.include?(result.downcase)

    puts 'Invalid input, remember the rules!>>'
    player_guess
  end

  def play_game
    (1..12).each do |n|
      puts "Turn #{n}"
      @guess = player_guess
      break if EXIT_KEYS.include?(guess.downcase)

      @guess = guess.split('')
      show_code(guess)
      break if solved?(key, guess)

      # output the clues to show the player
      guess_result
    end
  end

  def game_over
    if solved?(key, guess)
      puts 'You cracked the code!'
    else
      puts 'Game over...'
      print 'The key was:  '
      show_code(key)
      puts ''
    end
    # prompt the user to play again
  end

  def guess_result
    evaluate_guess(key, guess)
    show_clues(exact_matches, half_matches)
  end
end
