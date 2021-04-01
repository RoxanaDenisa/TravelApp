//import 'dart:html';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageService extends ChangeNotifier {
  Future<dynamic> loadImage(BuildContext context) {}
}

uploadImage() async {
  final _picker = ImagePicker();
  PickedFile image;
  //check permission
  await Permission.photos.request();
  var permissionStatus = await Permission.photos.status;
  if (permissionStatus.isGranted) {
    //select image
    image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image.path);
    if (image != null) {
      //upload to firebase

    } else {
      print('no path received');
    }
  } else {
    print('grant permissions and try again');
  }
}
