import 'package:flutter/cupertino.dart';

class ColorProductProvider extends ChangeNotifier {
  int colorController = 1;
  void colorProductProvider(int index) {
    colorController = index;
    notifyListeners();
  }
}
