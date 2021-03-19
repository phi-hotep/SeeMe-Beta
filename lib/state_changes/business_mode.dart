import 'package:flutter/material.dart';

class BusinessMode with ChangeNotifier {
  bool _isSwitchToBusinessMode = false;

  bool get isSwitchToBusinessMode => _isSwitchToBusinessMode;

  set isSwitchToBusinessMode(bool newValue) {
    _isSwitchToBusinessMode =
        newValue; // newValue correspond à la valeur booléenne générée lorsque l'utilisateur a activé le bouton Switch pour passer en mode Business
    notifyListeners();
  }
}
