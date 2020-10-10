class User {
  final String uid;
  final String email;
  String role;
  User({this.uid, this.email, this.role});

  String get roleGet {
    return this.role;
  }

  set roleSet(String value) {
    this.role = value;
  }
}
