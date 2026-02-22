import 'package:flutter/material.dart';

enum CardType { red, blue, green, yellow, black }

class ColorService extends ChangeNotifier {
  Map<CardType, int> card = {
    CardType.red: 0,
    CardType.blue: 0,
    CardType.green: 0,
    CardType.yellow: 0,
    CardType.black: 0,
  };

  void onCardTap(CardType color) {
    card[color] = (card[color] ?? 0) + 1;
    notifyListeners();
  }
}
