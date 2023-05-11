require_relative '../text/text_instructions.rb'

class Game
  include TextInstructions

  def start_game
    puts instructions
  end

  def select_mode
    result = gets.chomp
    return result if result.match(/^[1-2]$/)
    return result if %w[q exit].include?(result)

    puts "Invalid input, please only enter '1', '2', 'q', or 'exit'"
    select_mode
  end
end
