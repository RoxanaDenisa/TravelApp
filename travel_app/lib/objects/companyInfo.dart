class MyCompanyInfo{
  final String location;
  final String uid;
  final String name;
  MyCompanyInfo({
    this.uid,
    this.location,
    this.name
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'location': location,
      'name': name
    };
  }
  MyCompanyInfo.fromFirestore( Map<String,dynamic> f)
    :uid=f['uid'],
    location=f['location'],
    name=f['name'];
}
