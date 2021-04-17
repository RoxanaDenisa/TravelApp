import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/objects/companyInfo.dart';
import 'package:travel_app/objects/images.dart';
import 'package:travel_app/services/companyInfoService.dart';
import 'package:travel_app/services/imageService.dart';

class CompanyInfoProvider with ChangeNotifier {
  String _uid;
  String _location;
  String _name;
  String _searchKey;
  String _searchKey2;
  final ciService = CompanyInfoService();
  String get uid => _uid;
  String get location => _location;
  String get name => _name;
  String get searchKey => _searchKey;
  String get searchKey2 => _searchKey2;
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
    print('e');
    if (_uid == null) {
      var newProduct = MyCompanyInfo(
          uid: uid,
          location: location,
          name: name,
          searchKey: searchKey,
          searchKey2: searchKey2);
      ciService.infoCompAdd(newProduct);
      print('da');
    } else {
      var newProduct = MyCompanyInfo(
          uid: _uid,
          location: _location,
          name: _name,
          searchKey: _searchKey,
          searchKey2: _searchKey2);
      ciService.infoCompAdd(newProduct);
      print('nu');
    }
  }

  loadValues(MyCompanyInfo companyInfo) {
    _name = companyInfo.name;
    _uid = companyInfo.uid;
    _location = companyInfo.location;
    _searchKey = companyInfo.searchKey;
  }
}
