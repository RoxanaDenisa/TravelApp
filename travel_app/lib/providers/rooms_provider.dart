import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/services/roomService.dart';

class RoomsProvider with ChangeNotifier {
  String _type;
  int _price;
  String _benefits;
  String _uid;
  String _uidHotel;
  final roomService = RoomService();
  String get uid => _uid;
  String get type => _type;
  int get price => _price;
  String get benefits => _benefits;
  String get uitHotel => _uidHotel;
  setUidHotel(String value) {
    _uidHotel = value;
    notifyListeners();
  }

  setType(String value) {
    _type = value;
    notifyListeners();
  }

  setPrice(int value) {
    _price = value;
    notifyListeners();
  }

  setBenefits(String value) {
    _benefits = value;
    notifyListeners();
  }

  setUID(String value) {
    _uid = value;
    notifyListeners();
  }

  toSave() {
    var newProduct = MyRooms(
        uid: uid,
        type: type,
        price: price,
        benefits: benefits,
        uidHotel: _uidHotel);
    roomService.roomAdd(newProduct);
  }
}
