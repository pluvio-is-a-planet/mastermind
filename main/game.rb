# frozen_string_literal: true

require_relative '../text/text_instructions'

# this class is used to start the game
class Game
  include Display
  include TextInstructions

  def start_game
    puts instructions
    game_mode = select_mode
    code_maker if game_mode == '1'
    code_breaker if game_mode == '2'
  end

  def select_mode
    result = gets.chomp
    return result if result.match(/^[1-2]$/)
    return result if %w[q exit].include?(result.downcase)

    error_message('mode')
    select_mode
  end

  def code_breaker
    session = Player.new
    session.game
  end

  def code_maker
    session = Cpu.new
    session.cpu_start
  end
end
