# frozen_string_literal: true

require_relative 'game_logic'
require_relative 'display'
require_relative '../text/text_output'

# this class is used when the player chooses to be the code maker
class Cpu
  attr_reader :user_key, :turn_count, :exact_matches, :half_matches,
              :total_matches, :find_code_guesses, :four_numbers

  include Display
  include GameLogic
  include TextOutput

  def cpu_start
    puts turn_message('prompt key')
    @user_key = set_code
    show_code(user_key)
    puts turn_message('key')
    find_code_numbers
    find_code_order
    game_over(@permutations[0])
  end

  def set_code
    result = gets.chomp
    return result.split('') if result.match(/^[1-6]{4}$/)

    puts error_message('key')
    set_code
  end

  def cpu_turn(key, guess)
    puts turn_message('computer', turn_count)
    sleep 2
    show_code(guess)
    evaluate_guess(key, guess)
    show_clues(exact_matches, half_matches)
    temp_guess = guess.clone
    @find_code_guesses << [temp_guess, exact_matches, half_matches]
  end

  def find_code_numbers
    @turn_count = 1
    @find_code_guesses = []
    @four_numbers = find_four_numbers(OPTIONS.shuffle)
  end

  def find_four_numbers(options, index = 0, guess = [])
    guess.pop(4 - total_matches) unless turn_count == 1
    guess << options[index] until guess.length == 4
    cpu_turn(user_key, guess)
    @turn_count += 1
    return guess if total_matches == 4

    find_four_numbers(options, index + 1, guess)
  end

  def find_code_order
    @permutations = create_permutations(four_numbers)
    @permutations.uniq!
    compare_previous_guesses()
    final_turns
  end

  def create_permutations(array)
    array.permutation.to_a
  end

  def compare_previous_guesses
    @find_code_guesses.each { |code| compare_permutations(code) }
  end

  def compare_permutations(code)
    run_permutations(code[0], code[1], code[2])
  end

  def run_permutations(code, exact, half)
    @permutations.each do |item|
      evaluate_guess(item, code)
      reduce_permutations(item) unless exact_matches == exact && half_matches == half
    end
  end

  def reduce_permutations(code)
    @permutations.reject! { |item| item == code }
  end

  def final_turns
    until @turn_count > 12
      cpu_turn(user_key, @permutations[0])
      @turn_count += 1
      break if solved?(user_key, @permutations[0])

      run_permutations(@permutations[0], exact_matches, half_matches)
    end
  end

  def game_over(guess)
    message = solved?(user_key, guess) ? game_message('cpu won') : game_message('cpu lost')
    puts message
    play_again?
  end
end
