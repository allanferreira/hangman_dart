import 'dart:io';

void simpleHangman() {
  String displayLetters;
  String guess;
  bool win;

  final secretWord = 'banana';
  final setSecretWord = secretWord.split('').toSet();

  var notFoundLetters = <String>{};
  var correctGuesses = <String>{};
  var wrongGuesses = <String>{};

  print('* Welcome to The Hangman');

  while (win == null) {
    displayLetters = secretWord;
    notFoundLetters = setSecretWord.difference(correctGuesses);

    for (var letter in notFoundLetters) {
      displayLetters = displayLetters.replaceAll(letter, '_');
    }

    print('=======================');
    print('Lifes: ${6 - wrongGuesses.length}');
    print('Secret word:   ${displayLetters}');
    print('Wrong guesses: ${wrongGuesses.join(', ')}');
    print('=======================');

    print('Guess a letter:');
    guess = stdin.readLineSync();

    if (secretWord.contains(guess)) {
      correctGuesses.add(guess);
    } else {
      wrongGuesses.add(guess);
    }

    if (correctGuesses.containsAll(setSecretWord)) {
      win = true;
    } else if (wrongGuesses.length >= 6) {
      win = false;
    }
  }

  if (win) {
    print('Congratulations! You won.');
  } else {
    print('Lifes: 0');
    print('What a shame! The word is "${secretWord}"');
  }

  print('Thanks for playing');
}
