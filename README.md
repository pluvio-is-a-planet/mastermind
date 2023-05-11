# Mastermind

This project was completed as part of The Odin Project.

# The Game

<em>"Mastermind or Master Mind is a code-breaking game for two players. It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century."</em> ~ Wikipedia

According to Wikipedia, the game has many different versions of the game with their own rulesets.
So, instead of writing this program to handle every possible version of the game,
I chose the ruleset of :
 - There are 6 different numbers to create the code from.
 - The code consists of 4 digits, and may contain duplicates.
 - The code breaker gets 12 chances to guess the code.
 - The code breaker gets clues for exact matches, and correct numbers that are not in the right
   position.

# How To Play

This rendition of the <strong>Mastermind</strong> game is strictly a player-versus-computer game.
It is played in the command-line by typing 'ruby {path}/main/main.rb' where path is the location
of the folder containing all the files.

You can choose to be the code-<strong>maker</strong> or the code-<strong>breaker</strong>. If
you choose to be the code-breaker, the computer randomly generates a code for you to guess.
Otherwise, you have to enter the code for the computer to guess. Each different number is
assigned to a different color, but the user only needs to enter a sequence of numbers to make
their guess.
