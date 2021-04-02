class MyImages {
  final String image;
  final String uid;
  MyImages({
    this.image,
    this.uid,
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
    };
  }
}
