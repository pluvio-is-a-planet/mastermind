module GameLogic
  OPTIONS = %w[1 2 3 4 5 6].freeze
  EXIT_KEYS = %w[q exit].freeze

  def evaluate_guess(key, guess)
    temp_key = key.clone
    temp_guess = guess.clone
    @exact_matches = exact_match(temp_key, temp_guess)
    @half_matches = half_match(temp_key, temp_guess)
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
    Game.new.start_game if result.downcase == 'y'
  end
end
