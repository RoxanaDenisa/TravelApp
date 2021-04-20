import 'package:flutter/cupertino.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/services/companyInfoService.dart';

class CompanyInfoProvider with ChangeNotifier {
  String _uid;
  String _location;
  String _name;
  String _searchKey;
  String _searchKey2;
  String _mail;
  String _phone;
  final ciService = CompanyInfoService();
  String get uid => _uid;
  String get location => _location;
  String get name => _name;
  String get searchKey => _searchKey;
  String get searchKey2 => _searchKey2;
  String get mail => _mail;
  String get phone => _phone;
  setMail(String value) {
    _mail = value;
    notifyListeners();
  }

  setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  setLocation(String value) {
    _location = value;
    notifyListeners();
  }

  setUID(String value) {
    _uid = value;
    notifyListeners();
  }

  setName(String value) {
    _name = value;
    notifyListeners();
  }

  setSearchKey(String value) {
    _searchKey = value;
    notifyListeners();
  }

  setSearchKey2(String value) {
    _searchKey2 = value;
    notifyListeners();
  }

  toSave() {
    if (_uid == null) {
      var newProduct = MyCompanyInfo(
          uid: uid,
          location: location,
          name: name,
          searchKey: searchKey,
          searchKey2: searchKey2,
          mail: mail,
          phone: phone);
      ciService.infoCompAdd(newProduct);
    } else {
      var newProduct = MyCompanyInfo(
          uid: _uid,
          location: _location,
          name: _name,
          searchKey: _searchKey,
          searchKey2: _searchKey2,
          mail: _mail,
          phone: _phone);
      ciService.infoCompAdd(newProduct);
    }
  }

  loadValues(MyCompanyInfo companyInfo) {
    _name = companyInfo.name;
    _uid = companyInfo.uid;
    _location = companyInfo.location;
    _searchKey = companyInfo.searchKey;
    _searchKey2 = companyInfo.searchKey2;
    _mail = companyInfo.mail;
    _phone = companyInfo.phone;
  }
}
