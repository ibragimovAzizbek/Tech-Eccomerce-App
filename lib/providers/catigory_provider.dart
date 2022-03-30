import 'package:flutter/foundation.dart';

class CatigoryProvider extends ChangeNotifier {
  int catigoryIndex = 0;
  void catigoryProvider(int index) {
    catigoryIndex = index;
    notifyListeners();
  }
}
