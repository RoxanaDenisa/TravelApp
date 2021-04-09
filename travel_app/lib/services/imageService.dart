//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:travel_app/objects/images.dart';
import 'package:path/path.dart' as Path;

class ImageService{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> imgAdd(MyImages myImages) {
    return _db.collection('dbImages').doc(myImages.prodId).set(myImages.toMap());
  }
  Stream<List<MyImages>>getImage(){
    return _db.collection('dbImages').snapshots().map((snapshot) => snapshot.docs.map((document)=>MyImages.fromFirestore(document.data())).toList());
  }
   Future<void>removeImage(MyImages myImages)async{
    if(myImages.image!=null){
      var fileUrl = Uri.decodeFull(Path.basename(myImages.image)).replaceAll(new RegExp(r'(\?alt).*'), '');
      final Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(fileUrl);
      await firebaseStorageRef.delete();
    }
    return _db.collection('dbImages').doc(myImages.prodId).delete();
    
  }
  
}
