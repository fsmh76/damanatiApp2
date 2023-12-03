//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Future<String?> pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    // If an image is selected, return its file path
    return _file.path;
  }

  // If no image is selected, print a message and return null (or some other value indicating no image)
  print('No Images Selected');
  return null;
}


