class MyRooms {
  final String type;
  final int price;
  final String benefits;
  final String uidHotel;
  final String uid;
  MyRooms({this.type, this.price, this.benefits, this.uid, this.uidHotel});
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'price': price,
      'benefits': benefits,
      'uid': uid,
      'uidHotel': uidHotel
    };
  }

  String getPriceString() {
    int x = this.price;
    return '$x';
  }

  MyRooms.fromFirestore(Map<String, dynamic> f)
      : type = f['type'],
        price = f['price'],
        benefits = f['benefits'],
        uidHotel = f['uidHotel'],
        uid = f['uid'];
}
