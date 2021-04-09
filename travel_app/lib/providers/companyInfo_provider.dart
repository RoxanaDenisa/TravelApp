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
  final ciService = CompanyInfoService();
  String get uid => _uid;
  String get location => _location;
  String get name=>_name;
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
  toSave() {
    print('e');
    if(_uid==null){
    var newProduct = MyCompanyInfo(uid: uid, location: location, name: name);
    ciService.infoCompAdd(newProduct);
    print('da');
    }
  else{
    var newProduct = MyCompanyInfo(uid: _uid, location: _location, name: _name);
    ciService.infoCompAdd(newProduct);
    print('nu');
  }
  }
  loadValues(MyCompanyInfo companyInfo){
     _name=companyInfo.name;
     _uid=companyInfo.uid;
     _location=companyInfo.location;
   }
  
}
