class MyImages {
  final String image;
  final String uid;
  final prodId;
  MyImages({
    this.image,
    this.uid,
    this.prodId
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
      'prodId':prodId
    };
  }
  MyImages.fromFirestore( Map<String,dynamic> f)
    :uid=f['uid'],
    image=f['image'],
    prodId=f['prodId'];
}
