class MyCompanyInfo {
  final String location;
  final String uid;
  final String name;
  final String searchKey;
  final String searchKey2;
  MyCompanyInfo(
      {this.uid, this.location, this.name, this.searchKey, this.searchKey2});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'location': location,
      'name': name,
      'searchKey': searchKey,
      'searchKey2': searchKey2
    };
  }

  MyCompanyInfo.fromFirestore(Map<String, dynamic> f)
      : uid = f['uid'],
        location = f['location'],
        name = f['name'],
        searchKey = f['searchKey'],
        searchKey2 = f['searchKey2'];
}
