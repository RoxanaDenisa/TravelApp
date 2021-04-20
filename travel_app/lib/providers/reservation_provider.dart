import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/reservation.dart';
import 'package:travel_app/services/reservationService.dart';

class ReservationProvider with ChangeNotifier {
  String _uid;
  String _name;
  String _nrPersoane;
  String _perioada;
  String _tipCamera;
  int _pret;
  int _nrZile;
  String _status;
  String _uidClient;
  final reservationService = ReservationService();
  String get uid => _uid;
  String get name => _name;
  String get nrPersoane => _nrPersoane;
  String get perioada => _perioada;
  String get tipCamera => _tipCamera;
  String get uidClient => _uidClient;
  int get pret => _pret;
  int get nrZile => _nrZile;
  String get status => _status;
  setNrZile(int value) {
    _nrZile = value;
    notifyListeners();
  }

  setUidClient(String value) {
    _uidClient = value;
    notifyListeners();
  }

  setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  setname(String value) {
    _name = value;
    notifyListeners();
  }

  setNrPersoane(String value) {
    _nrPersoane = value;
    notifyListeners();
  }

  setPerioada(String value) {
    _perioada = value;
    notifyListeners();
  }

  setTipCamera(String value) {
    _tipCamera = value;
    notifyListeners();
  }

  setPret(int value) {
    _pret = value;
    notifyListeners();
  }

  setUID(String value) {
    _uid = value;
    notifyListeners();
  }

  toSave() {
    if (_uid == null) {
      var newProduct = Reservation(
          uid: uid,
          name: name,
          nrPersoane: nrPersoane,
          perioada: perioada,
          tipCamera: tipCamera,
          pret: pret,
          nrZile: nrZile,
          status: status,
          uidClient: uidClient);
      reservationService.reservationAdd(newProduct);
    } else {
      var newProduct = Reservation(
          uid: _uid,
          name: _name,
          nrPersoane: _nrPersoane,
          perioada: _perioada,
          tipCamera: _tipCamera,
          pret: _pret,
          nrZile: _nrZile,
          status: _status,
          uidClient: _uidClient);
      reservationService.reservationAdd(newProduct);
    }
  }

  deleteReservation(Reservation r) {
    reservationService.removeReservation(r);
  }
}
