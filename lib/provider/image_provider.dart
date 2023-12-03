import 'package:flutter/material.dart';

class ImageProviderClass extends ChangeNotifier {
  late String _selectedImagePath;

  String get selectedImagePath => _selectedImagePath;

  void setImagePath(String path) {
    _selectedImagePath = path;
    notifyListeners();
  }
}
