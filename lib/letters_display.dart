void lettersDisplay(Set guesses, String secretWord, Set wrongGuesses) {

  var wordLetters = secretWord.split('').toSet();

  var notFoundLetters = wordLetters.difference(guesses);
  for(var letter in notFoundLetters){
    secretWord = secretWord.replaceAll(letter, '_');
  }

  print('=======================');
  print('Secret word:   ${secretWord}');
  print('Wrong guesses: ${wrongGuesses.join(', ')}');
  print('=======================');

}
