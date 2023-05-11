# frozen_string_literal: true

require 'io/console'

# module that contains the main functionality of the game
module GameLogic
  OPTIONS = %w[1 2 3 4 5 6].freeze
  EXIT_KEYS = %w[q exit].freeze

  def evaluate_guess(key, guess)
    temp_key = key.clone
    temp_guess = guess.clone
    @exact_matches = exact_match(temp_key, temp_guess)
    @half_matches = half_match(temp_key, temp_guess)
    @total_matches = exact_matches + half_matches
  end

  def exact_match(key, guess)
    result = 0
    key.each_with_index do |color, index|
      next unless color == guess[index]

      result += 1
      key[index] = '*'
      guess[index] = '*'
    end
    result
  end

  def half_match(key, guess)
    result = 0
    guess.each_with_index do |color, index|
      next unless color != key[index] && key.include?(color)

      result += 1
      to_be_removed = key.find_index(guess[index])
      key[to_be_removed] = '?'
      guess[index] = '?'
    end
    result
  end

  def solved?(key, guess)
    key == guess
  end

  def play_again?
    puts game_message('play again')
    result = gets.chomp
    puts game_message('thanks') if result.downcase != 'y'
    return unless result.downcase == 'y'

    $stdout.clear_screen
    Game.new.start_game
  end
end
