class Deck {
  List _cards = ["1", '3', '5', '8',' 13', '17', '21'];

  // getter & setter
  List get cards => _cards;
  void set cards(List cards) {
    _cards = cards;
  }
}