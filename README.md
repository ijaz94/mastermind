# mastermind

# Game Initialization:

The player is asked whether they want to be the code maker or the code guesser.

# Player as Code Guesser (player_as_code_guesser):

The computer randomly generates a secret code.
The player has 12 attempts to guess the code, with feedback provided after each guess.

# Player as Code Maker (player_as_code_maker): -->

The player sets a secret code. The computer attempts to guess the player's code, receiving feedback after each guess.

# Validation and Feedback:

The player's input is validated to ensure it’s a valid code (4 colors from the available set). The feedback provided indicates whether each color is an exact match (correct color in the correct position) or a near match (correct color in the wrong position).

# Winning Conditions:

If the player is the guesser and correctly guesses the code, they win.
If the computer is the guesser and correctly guesses the code, it wins.
If the player is the code maker and the computer cannot guess the code within 12 attempts, the player wins.

This version allows the human player to engage in the game from either perspective, offering a different experience depending on the chosen role.
