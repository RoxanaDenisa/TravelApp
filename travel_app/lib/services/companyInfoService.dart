//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/images.dart';
import 'package:path/path.dart' as Path;

class CompanyInfoService{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> infoCompAdd (MyCompanyInfo myCompanyInfo) {
    return _db.collection('dbCompanyInfo').doc(myCompanyInfo.uid).set(myCompanyInfo.toMap());
  }
  Stream<List<MyCompanyInfo>>getInfo(){
    return _db.collection('dbCompanyInfo').snapshots().map((snapshot) => snapshot.docs.map((document)=>MyCompanyInfo.fromFirestore(document.data())).toList());
  }
  
  
  
}
