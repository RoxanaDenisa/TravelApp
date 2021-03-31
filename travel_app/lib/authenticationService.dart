
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void>userSetup(String _name,String _email, String _phone, String _uname, bool _c1,bool _c2) async
{
  CollectionReference users=FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth=FirebaseAuth.instance;
  String uid=auth.currentUser.uid.toString();
  users.add({'uid':uid, 'Name': _name,'email':_email, 'Phone':_phone,'Uname':_uname,'Customer':_c1,'Company':_c2});
  return ;
}

  Future queryData(String queryString) async{
  return FirebaseFirestore.instance.collection('Users').where('email',isEqualTo: queryString).snapshots();

  
}

