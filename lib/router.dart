import 'package:flutter/material.dart';

import 'package:planningpoker/main.dart';
import 'package:planningpoker/ui/deck_card.dart';
import 'package:planningpoker/ui/settings.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Main());
      case 'showcard':
        final cardValue = settings.arguments;
        return MaterialPageRoute(builder: (_) => DeckCard(cardValue: cardValue));
      case 'settings':
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}