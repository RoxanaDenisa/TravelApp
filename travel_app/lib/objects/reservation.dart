class Reservation {
  final String uid;
  final String name;
  final String nrPersoane;
  final String perioada;
  final String tipCamera;
  final int pret;
  final int nrZile;
  final String status;
  final String uidClient;
  Reservation(
      {this.uid,
      this.name,
      this.nrPersoane,
      this.perioada,
      this.tipCamera,
      this.pret,
      this.nrZile,
      this.status,
      this.uidClient});
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
      'uidClient': uidClient,
    };
  }

  String getPriceString() {
    int x = this.pret;
    return '$x';
  }

  String getDaysString() {
    int x = this.nrZile;
    return '$x';
  }

  Reservation.fromFirestore(Map<String, dynamic> f)
      : uid = f['uid'],
        name = f['name'],
        nrPersoane = f['nrPersoane'],
        perioada = f['perioada'],
        tipCamera = f['tipCamera'],
        pret = f['pret'],
        status = f['status'],
        uidClient = f['uidClient'],
        nrZile = f['nrZile'];
}
