import 'package:flutter/cupertino.dart';

class ImagesProvider with ChangeNotifier {
  String _uid;
  String _image;
  String get uid => _uid;
  String get image => _image;
  setImage(String value) {
    _image = value;
  }
}
