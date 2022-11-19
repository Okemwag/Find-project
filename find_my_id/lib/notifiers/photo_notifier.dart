import 'dart:io';

import 'package:flutter/material.dart';

class PhotosNotifier extends ChangeNotifier {
  File? selectedPhoto;

  selectImage(File file) {
    selectedPhoto = file;
  }

  removeImage(File file) {
    selectedPhoto = null;
  }
}
