bool playing(String secretWord, Set correctGuesses, Set wrongGuesses) {
  return !win(secretWord, correctGuesses) && !lose(wrongGuesses);
}

bool lose(Set wrongGuesses) {
  return wrongGuesses.length >= 6;
}

bool win(String secretWord, Set correctGuesses) {
  var wordLetters = secretWord.split('').toSet();
  return correctGuesses.containsAll(wordLetters);
}
