class Reservation {
  final String uid;
  final String name;
  final String nrPersoane;
  final String perioada;
  final String tipCamera;
  final int pret;
  final int nrZile;
  final String status;
  Reservation(
      {this.uid,
      this.name,
      this.nrPersoane,
      this.perioada,
      this.tipCamera,
      this.pret,
      this.nrZile,
      this.status});
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'nrPersoane': nrPersoane,
      'perioada': perioada,
      'tipCamera': tipCamera,
      'pret': pret,
      'nrZile': nrZile,
      'status': status,
    };
  }

  Reservation.fromFirestore(Map<String, dynamic> f)
      : uid = f['uid'],
        name = f['name'],
        nrPersoane = f['nrPersoane'],
        perioada = f['perioada'],
        tipCamera = f['tipCamera'],
        pret = f['pret'],
        status = f['status'],
        nrZile = f['nrZile'];
}
