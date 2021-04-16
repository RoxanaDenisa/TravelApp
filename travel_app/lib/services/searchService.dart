import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByLocation(String searchField) {
    return FirebaseFirestore.instance
        .collection('dbCompanyInfo')
        .where('searchKey',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('dbCompanyInfo')
        .where('searchKey2',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .get();
  }
}
