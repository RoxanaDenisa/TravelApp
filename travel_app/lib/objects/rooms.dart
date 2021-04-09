class MyRooms {
  final String type;
  final String price;
  final String benefits;
  final String uid;
  MyRooms({
    this.type,
    this.price,
    this.benefits,
    this.uid
  });
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'price': price,
      'benefits': benefits,
      'uid':uid
    };
  }
  MyRooms.fromFirestore( Map<String,dynamic> f)
    :type=f['type'],
    price=f['price'],
    benefits=f['benefits'],
    uid=f['uid'];
  
}