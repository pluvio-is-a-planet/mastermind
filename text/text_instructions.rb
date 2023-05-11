# frozen_string_literal: true

require_relative 'text_output'

# rubocop:disable Metrics/AbcSize

# module to contain the instructions for the game
module TextInstructions
  include TextOutput

  def instructions
    <<~DOC

      #{stylize_output('Welcome to mastermind!', 'bright')}
      #{stylize_output('How to play:', 'underline')}


      This is a #{stylize_output('player-versus-computer', 'bright')} game.
      To start the game, you have to choose between being the code #{stylize_output('MAKER', 'color', '94;1')} and the code #{stylize_output('BREAKER', 'color', '91;1')}

      Then, the code #{stylize_output('MAKER', 'color', '94;1')} will choose four numbers/colors from
      the following list to create a 'key':

      #{code_color('1')} #{code_color('2')} #{code_color('3')} #{code_color('4')} #{code_color('5')} #{code_color('6')}

      For example,

      #{code_color('6')} #{code_color('3')} #{code_color('5')} #{code_color('5')}

      From the example above, it is shown that the 'key' can contain duplicates.
      To win, the code #{stylize_output('breaker', 'color', '91')} must guess the 'key' in 12, or less, attempts.


      #{stylize_output('Clues:', 'underline')}
      After each guess, the code #{stylize_output('breaker', 'color', '91')} will be provided with up to
      four clues to aid them in 'breaking' the 'key'.

        #{clue_color('*')} - This clue indicates that the code #{stylize_output('breaker', 'color', '91')}'s guess has 1 correct number in the correct position.
        #{clue_color('?')} - This clue indicates that the code #{stylize_output('breaker', 'color', '91')}'s guess has 1 correct number, but in the wrong position.


      Following the above example, if the code #{stylize_output('breaker', 'color', '91')} guesses

      #{code_color('3')} #{code_color('5')} #{code_color('1')} #{code_color('5')}

      They will be provided with the following clues: #{clue_color('*')} #{clue_color('?')} #{clue_color('?')}
      Indicating that they have #{stylize_output('1 correct number in the correct position, and 2 correct numbers in the wrong position', 'bright')}

      Phew! That was a lot of reading, #{stylize_output("It's time to play mastermind!", 'underline')}
      Now you get to choose, do you want to be the code #{stylize_output('MAKER', 'color', '94;1')} or the code #{stylize_output('BREAKER', 'color', '91;1')}?

        Enter '1' if you want to be the code #{stylize_output('MAKER', 'color', '94;1')}
        Enter '2' if you want to be the code #{stylize_output('BREAKER', 'color', '91;1')}
    DOC
  end
end

# rubocop:enable Metrics/AbcSize
