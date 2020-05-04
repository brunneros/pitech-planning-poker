class Deck {
  List<String> _cards;
  String title;
  String icon;

  List<String> get cards => _cards;
  set cards(List<String> cards) {
    _cards = cards;
  }

  Deck(this.title, this._cards, this.icon);
}