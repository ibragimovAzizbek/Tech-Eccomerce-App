import 'package:flutter/cupertino.dart';

class BottomBarProvider extends ChangeNotifier {
  int bottomIndex = 0;

  void bottomBarProvider(index) {
    bottomIndex = index;
    notifyListeners();
  }
}