import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/services/imageService.dart';

class ImagesProvider with ChangeNotifier {
  String _uid;
  String _image;
  final imageService = ImageService();
  String get uid => _uid;
  String get image => _image;
  setImage(String value) {
    _image = value;
    notifyListeners();
  }

  setUID(String value) {
    _uid = value;
    notifyListeners();
  }

  toSave() {
    var newProduct = MyImages(uid: uid, image: image);
    imageService.imgAdd(newProduct);
  }
}
