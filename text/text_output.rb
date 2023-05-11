# frozen_string_literal: true

require_relative '../main/display'

# rubocop:disable Layout/LineLength

# module to display text for the game
module TextOutput
  include Display

  def turn_message(type, num = nil)
    {
      'prompt guess' => "Turn ##{num}: Enter your guess, or 'q' or 'exit' to quit the game.>>",
      'computer turn' => "\nComputer turn: ##{num}>>",
      'computer think' => "Thinking...\n",
      'start guessing' => 'The secret key has been set, can you guess it?>>',
      'prompt key' => 'Enter the code for the computer to guess>>',
      'key' => "  is your key.\n"
    }[type]
  end

  def game_message(type)
    {
      'user won' => "  Congratulations! You broke the key! \n\n",
      'user lost' => 'Game over... The key was:',
      'cpu won' => "\nGame over... The computer somehow managed to crack your key.",
      'cpu lost' => "\nThe computer just could not crack your key and you won the game!",
      'play again' => "\n\nWould you like to play again? Enter 'y' to play again or any other key to quit.",
      'thanks' => "Thank you so much for playing my version of #{stylize_output('Mastermind', 'color', '92')}!\nCheck out my Github at #{stylize_output('https://github.com/pluvio-is-a-planet', 'bright')}."
    }[type]
  end

  def error_message(type)
    {
      'mode' => stylize_output("Enter '1' to be the code MAKER or '2' to be the code BREAKER, or 'q' or 'exit' to quit.", 'color', '91'),
      'turn' => stylize_output('Your guess should only contain 4 digits between 1 and 6.', 'color', '91'),
      'key' => stylize_output('Your key has to be 4 characters long, using numbers between 1 and 6.', 'color', '91')
    }[type]
  end
end

# rubocop:enable Layout/LineLength
