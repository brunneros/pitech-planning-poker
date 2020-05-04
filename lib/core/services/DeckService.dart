import 'package:planningpoker/core/models/deck.dart';

class DeckService {
  Deck _currentDeck;
  List<Deck> _decks = [];

  Deck get currentDeck => _currentDeck;

  List<Deck> get decks => _decks;

  set currentDeck(Deck deck) {
    _currentDeck = deck;
  }

  Future<List<Deck>> getAllDecks() async {
    _decks = _getDummyDeck();
    return _decks;
  }

  List<Deck> _getDummyDeck() {
    return [
      Deck("FIBONACCI", ["1", '3', '5', '8', '13', "21"],
          "lib/assets/images/Asset60.png"),
      Deck("T-SHIRT", ["XS", 'S', 'M', 'L', 'XL', 'XXL'],
          "lib/assets/images/Asset81.png"),
    ];
  }
}
