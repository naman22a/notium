import 'package:flutter/material.dart';

class PickedColorProvider with ChangeNotifier {
  Color _pickedColor = Colors.purple;

  Color get pickedColor => _pickedColor;

  set pickedColor(Color color) {
    _pickedColor = color;
    notifyListeners();
  }

  void setColor(Color color) {
    _pickedColor = color;
    notifyListeners();
  }
}
