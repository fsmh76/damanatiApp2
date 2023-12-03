import 'package:flutter/material.dart';


class InputProvider with ChangeNotifier {
  //var selectedCountry;
  String phoneNumber = '';

  // void setCountryCode(value) {
  //   selectedCountry = value;
  //   notifyListeners();
  // }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }
}

