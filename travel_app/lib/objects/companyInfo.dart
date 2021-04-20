class MyCompanyInfo {
  final String location;
  final String uid;
  final String name;
  final String searchKey;
  final String searchKey2;
  final String mail;
  final String phone;
  MyCompanyInfo(
      {this.uid,
      this.location,
      this.name,
      this.searchKey,
      this.searchKey2,
      this.mail,
      this.phone});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'location': location,
      'name': name,
      'searchKey': searchKey,
      'searchKey2': searchKey2,
      'mail': mail,
      'phone': phone,
    };
  }

  MyCompanyInfo.fromFirestore(Map<String, dynamic> f)
      : uid = f['uid'],
        location = f['location'],
        name = f['name'],
        searchKey = f['searchKey'],
        mail = f['mail'],
        phone = f['phone'],
        searchKey2 = f['searchKey2'];
}
