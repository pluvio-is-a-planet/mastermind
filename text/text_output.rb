require_relative '../main/display'

module TextOutput
  include Display

  def messages(message, guesses = nil)
    {
      'input error' => "Invalid input, please remember the rules above. (Enter 'q' or 'exit' to quit the game)>>",
      'user wins' => "Congratulations! You have cracked the code after #{guesses} guesses.\n",
      'user loses' => "Game over...\nThe code was:  ",
      'cpu think' => 'Thinking...',
      'turn' => "Turn \##{guesses} enter your guess>>",
      'cpu wins' => "The computer cracked your code after #{guesses} guesses. Better luck next time.",
      'play again prompt' => 'Would you like to play again?>>',
      'thanks' => "Thank you so much for playing my version of #{stylize_output('Mastermind', 'color', '92')}!\nCheck out my Github at #{stylize_output('https://github.com/pluvio-is-a-planet', 'bright')}."
    }[message]
  end
end
