require_relative 'game_logic'
require_relative 'display'
require_relative 'text_output'

class Cpu
  include Display
  include GameLogic
  include TextOutput

end
