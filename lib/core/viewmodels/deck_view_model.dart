import 'package:flutter/foundation.dart';
import 'package:planningpoker/core/models/deck.dart';
import 'package:planningpoker/core/services/DeckService.dart';
import 'package:planningpoker/locator.dart';

class DeckViewModel extends ChangeNotifier {

  List<Deck> _decks = [];
  List<Deck> get decks => _decks;

  final DeckService _deckService = locator<DeckService>();
  Deck currentDeck;

  getDecks() async {
    _decks = await _deckService.getAllDecks();
    currentDeck = _deckService.currentDeck ?? _decks[0];
    notifyListeners();
  }

  setCurrentDeck(Deck deck) {
    currentDeck = deck;
    _deckService.currentDeck = deck;
    notifyListeners();
  }
}