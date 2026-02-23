import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppLockProvider with ChangeNotifier {
  final _box = Hive.box('settings');

  late bool _isAppLocked = _box.get('isAppLocked', defaultValue: false);

  bool get isAppLocked => _isAppLocked;

  void toggleLock() {
    _isAppLocked = !isAppLocked;
    _box.put('isAppLocked', _isAppLocked);
    notifyListeners();
  }
}
