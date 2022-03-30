import 'package:flutter/cupertino.dart';

class ShowPsswdProvider extends ChangeNotifier {
  bool isHiddin = true;
  void showPsswd() {
    isHiddin = !isHiddin;
    notifyListeners();
  }
}