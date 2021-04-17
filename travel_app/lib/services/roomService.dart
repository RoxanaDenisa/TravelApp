import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/objects/rooms.dart';

class RoomService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> roomAdd(MyRooms myRooms) {
    return _db.collection('dbRooms').doc(myRooms.uid).set(myRooms.toMap());
  }

  Stream<List<MyRooms>> getRoom() {
    return _db.collection('dbRooms').snapshots().map((snapshot) => snapshot.docs
        .map((document) => MyRooms.fromFirestore(document.data()))
        .toList());
  }
}
