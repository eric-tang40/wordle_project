# Project 00 For NeXT CS
### Class Period:
### Name0: Eric Tang
### Name1: Kai Chandan
---


Your mission is to recreate one of these three games that involve working with strings:
- [Wordle](https://wordplay.com/new)
- [Spelling Bee](https://spellingbeegame.org)
- [Type Racer](https://play.typeracer.com)

This project will be completed in phases. The first phase will be to work on this document. Use makrdown formatting. For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

All projects will require the following:
- A visual interface representative of the game. The entirety of the game should run in a window, not via the Processing console.
- Reading in text from a plain text file.
  - I will provide useful text files for the various games.
- The ability for users to start a new game without having to restart the program (either resetting after completing a round of the game, or allowing users to reset in the middle of a current game).
- Allowing text input via the keyboard.
- Some form of score/point system that is maintained while the program is running. (It does not need to keep track of score after the fact).

Wordle Specific Requirements:
- Gameplay should follow Wordle rules. The coloring of the squares should work the same way it does for Wordle (play a few rounds to understand th specifics surrounding duplicate letters).

Spelling Bee specific requirements:
- Users should be able to see the words they have already entered.

Type Racer specific requirements.
- There should be a visual indication of how are along the user is (similar to the cars in type racer).
- This should only be a 1-player game, even if you add other features.


---

## Phase 0: Game Selection, Analysis & Plan

#### Selected Game: WORDLE

### Rules
What are the core rules of your game?

Player guesses a 5-letter word form a word bank, and the letters of that word are sorted into gray, yellow and green which are respectively not in the answer, in the answer but in the wrong spot, and in the answer and in the right spot. The player gets 6 tries to guess the word and if he fails, the word is revealed. Words not in the word bank are rejected. Repeat words are allowed.

### Necessary Features
What are the core features that your game should have? These should be things that __must__ be implemented in order to make the game playable, not extra features that could be added to make the game more fun to play.

There must be a word bank, an interface with 30 boxes (6 rows of 5), a correct answer, and letters must turn the right color, display message to summarize the game. Only uppercase letters should appear in the boxes, but the user should not have to hold down shift.

### Extra Features
What are some features that are not essential to gameplay, but you would like to see (provided you have time after completing the necessary features.

A counter to keep track of your streak, animations for flipping the letters over, a keyboard on the screen to show which letters have been used, maybe clues or hints, and levels of difficulty. The arrow keys can be used to go to a different box which allows the user to edit any letter without having to delete other letters.

#### Interface
What will your game look like?

Very similar to the actual Wordle with 6 rows of 5 boxes,(potentially) a keyboard to see which letters have been used, and the Wordle logo (imported as an image).

### Controls
How will your game be controlled?

Keyboard Controls: The keyboard can be used to type like normal. The enter key finalizes a guess. Delete removes a letter. No numbers or special characters are allowed and those keys are unresponsive.


Mouse Controls: (Potentially) the mouse can be used to click on the keyboard displayed on the screen to type and other buttons that we create for special features (hints, reset) will be controlled by mouseClick.



### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes.

Box
- Instance variables:
  - size, x, y, char, color
- METHODS
  - setup : set the box's x, y, size, and initial text (which is the empty string)
  - display: display the box on the screen
  - type: changes the text inside of the box to what the user types
  - changeColor: change the color of the box based on the character it contains
  - reset: resets the box to its original setup

Keys
- Instance variables:
  - size, x, y, char, color
- METHODS
  - setup : set the key's x, y, size, and initial text (which is its respective letter on the qwerty keyboard)
  - display: display the key on the screen with its assigned letter as text in the middle
  - changeColor: change the color of the key based on whether the key's letter is in the correct answer
  - reset: resets the key to its original setup
  
