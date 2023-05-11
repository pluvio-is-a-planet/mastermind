require_relative '../main/display'

module TextOutput
  include Display

  def messages(message, guesses = nil, code = [])
    {
      'input error' => "Invalid input, please remember the rules above. (Enter 'q' or 'exit' to quit the game)",
      'user wins' => "Congratulations! You have cracked the code after #{guesses} guesses.\n",
      'user loses' => "Game over...\nThe code was:  ",
      'cpu think' => 'Thinking...',
      'turn' => "Turn \##{guesses} enter your guess>>"
    }[message]
  end
end
