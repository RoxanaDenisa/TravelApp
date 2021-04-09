import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/rooms.dart';
import 'package:travel_app/services/roomService.dart';

class RoomsProvider with ChangeNotifier {
  String _type;
  String _price;
  String _benefits;
  String _uid;
  final roomService = RoomService();
  String get uid => _uid;
  String get type => _type;
  String get price=>_price;
  String get benefits=>_benefits;
  setType(String value) {
    _type = value;
    notifyListeners();
  }
  setPrice(String value) {
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
    var newProduct = MyRooms(uid: uid, type: type,price: price,benefits: benefits);
    roomService.roomAdd(newProduct);
  }
  
}
