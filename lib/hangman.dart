import 'dart:io';
import 'game_condition.dart';
import 'letters_display.dart';
import 'life_display.dart';
import 'words.dart';

void hangman() {

  words.shuffle();

  final secretWord = words[0];
  var correctGuesses = <String>{};
  var wrongGuesses = <String>{};

  print('* Welcome to The Hangman');

  while (playing(secretWord, correctGuesses, wrongGuesses)) {
    lifeDisplay(wrongGuesses.length);
    lettersDisplay(correctGuesses, secretWord, wrongGuesses);

    String guess;
    var guessValidationStep = true;
    while(guessValidationStep) {
      print('Guess a letter:');
      guess = stdin.readLineSync();

      if(guess.length > 1) {
        print('Incorrect value! Please enter only one letter.');
      } else if(guess.isEmpty) {
        print('Incorrect value! Do not leave the field blank.');
      } else {
        guessValidationStep = false;
      }

    }

    var repeatedLetter = correctGuesses.contains(guess) || wrongGuesses.contains(guess);
    if (secretWord.contains(guess)) {
      correctGuesses.add(guess);
      print('Good!');
    } else if(repeatedLetter) {
      print('This letter has already been guessed! Try a new one.');
    } else {
      wrongGuesses.add(guess);
      print('Bad...');
    }
  }

  if(win(secretWord, correctGuesses)) {
    print('Congratulations! You won.');
  } else {
    lifeDisplay(wrongGuesses.length);
    print('What a shame! The word is "${secretWord}"');
  }

  var playAgainValidationStep = true;
  while(playAgainValidationStep) {
    print('Would you like to play again? [y/n]');
    var playAgain = stdin.readLineSync();

    switch(playAgain) {
      case 'y':
        playAgainValidationStep = false;
        hangman();
        print('Thanks for playing');
        break;

      case 'n':
        playAgainValidationStep = false;
        print('Thanks for playing');
        break;
      default:
        print('Incorrect value! Type "y" to continue playing or "n" to stop.');
    }
  }

}
