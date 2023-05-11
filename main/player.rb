require_relative 'game_logic'
require_relative 'display'
require_relative 'text_output'

class Player
  # include Display
  include GameLogic
  include TextOutput

  def initialize
    @key = random_key
  end

  def random_key
    result = (1..4).map { OPTIONS.sample }
  end
end
