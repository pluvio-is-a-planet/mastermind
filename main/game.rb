require_relative '../text/text_instructions.rb'

class Game
  include TextInstructions

  def start_game
    puts instructions
  end
end
