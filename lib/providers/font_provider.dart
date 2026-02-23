import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notium/common/constants.dart';

class FontProvider with ChangeNotifier {
  final _box = Hive.box('settings');

  late AppFontSize _size =
      _box.get('fontSize', defaultValue: AppFontSize.medium);

  AppFontSize get size => _size;

  double get scale {
    switch (_size) {
      case AppFontSize.small:
        return 0.9;
      case AppFontSize.medium:
        return 1.0;
      case AppFontSize.large:
        return 1.2;
    }
  }

  void setSize(AppFontSize newSize) {
    _size = newSize;
    _box.put('fontSize', newSize);
    notifyListeners();
  }
}
