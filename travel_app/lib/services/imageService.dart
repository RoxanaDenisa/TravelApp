//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:travel_app/objects/images.dart';

class ImageService extends ChangeNotifier {
  String uuid = Uuid().v1();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> imgAdd(MyImages myImages) {
    return _db.collection('dbImages').doc(uuid).set(myImages.toMap());
  }
}
