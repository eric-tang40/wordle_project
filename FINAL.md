# Project 00 For NeXT CS
### Class Period: 5th
### Name0: Kai Chandan
### Name1: Eric Tang
#### Selected Game: WORDLE
---

### How To Play

- The game is played by typing a five letter word into the display. Each letter goes into one box in the row the player is on.
- The player then presses **ENTER**; if the word is in the accepted word list, the player can go onto their second attempt. If not, the player has to backspace and choose another word.
- The boxes of the previous row will now change color according to what the player has inputted. If the letter does not appear in the final word, then the box will turn grey. If the letter appears in the final word but is in the wrong location, the box will turn yellow. If the letter appears in the final word and it is in the right location, the box will turn green.
  - This will also correlate with the colors of each individual key, which will change accordingly to white, grey, yellow, and green. 
- The player has a total of 6 turns to correctly guess the 5-letter word. 
  - If the player is unsuccessful in guessing the word over time, he loses the game and the word is revealed.


---

### Features
List all the game features you were able to implement.
- We were able to successsfully implement the display, complete with a 6 by 5 grid of boxes, a QWERTY keyboard, and the Wordle logo above the grid of boxes.
- We were able to implement the changing of box colors to grey, yellow, and green.
- We were able to implement a functional restart button that can be used to generate a new word from the start, restart at any point when the player decides to give up, or when the player wins/loses.
- We were able to implement a delete function that allows the player letter by letter to change their word, which is especially useful if the player has typed an invalid word.


---

### Changes
What changed about your game after the design phase? Separate changes that occurred after the feedback round and changes that occurred during programming.

**FEEDBACK ROUND:**
  - We were able to implement a message display by replacing the Wordle logo with messages based on user input
    - For example, the player typing an invalid word would return "Not in the Word List". The player winning the game would return a "You Won!" message, and losing the game would return a message containing the answer.

**DURING PROGRAMMING:**
  - We added a number of booleans (is_word, won, game_over) that we used to display the messages (and determine when they should go away).
  - We decided to make the keyboard three Grids (which are associated with each row), and have the letters be strings taken from a String array. This was easier and more efficient than creating an entirely new Keyboard class.
