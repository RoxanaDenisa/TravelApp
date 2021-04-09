import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/services/imageService.dart';

class ImagesProvider with ChangeNotifier {
  String _uid;
  String _image;
  String _prodId;
  final imageService = ImageService();
  String get uid => _uid;
  String get image => _image;
  String get prodId=>_prodId;
  setImage(String value) {
    _image = value;
    notifyListeners();
  }

  setUID(String value) {
    _uid = value;
    notifyListeners();
  }
  setProdId(String value) {
    _prodId = value;
    notifyListeners();
  }
  toSave() {
    var newProduct = MyImages(uid: uid, image: image, prodId: prodId);
    imageService.imgAdd(newProduct);
  }
  deleteImage(MyImages img){
     imageService.removeImage(img);
   }
}
