import 'package:flutter/foundation.dart';
import 'package:planningpoker/core/models/deck.dart';
import 'package:planningpoker/core/services/DeckService.dart';
import 'package:planningpoker/locator.dart';

class CardsTableModel extends ChangeNotifier {

  final DeckService _deckService = locator<DeckService>();
  Deck currentDeck;
  List<Deck> _decks = [];

  getDecks() async {
    _decks = await _deckService.getAllDecks();
    currentDeck = _deckService.currentDeck ?? _decks[0];
    notifyListeners();
  }

}