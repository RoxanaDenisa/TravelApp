import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/objects/reservation.dart';

class ReservationService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> reservationAdd(Reservation reservation) {
    return _db
        .collection('dbReservation')
        .doc(reservation.uid)
        .set(reservation.toMap());
  }

  Stream<List<Reservation>> getReservation() {
    return _db.collection('dbReservation').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => Reservation.fromFirestore(document.data()))
            .toList());
  }
}
