module GameLogic
  def evaluate_guess(key, guess); end

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
      next unless color != key[index] && key.include? color

      result += 1
      to_be_removed = key.find_index(guess[index])
      key[to_be_removed] = '?'
      guess[index] = '?'
    end
    result
  end

  def solved?(key, guess); end
end
