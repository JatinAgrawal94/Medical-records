import 'package:cloud_firestore/cloud_firestore.dart';

class Roles {
  Firestore _firestore = Firestore.instance;

  void addUser(dynamic result) {
    _firestore
        .collection('users')
        .document(result.uid)
        .setData({"email": result.email, "role": result.role}).then(
            (value) => print("User added"));
  }

  Future<Map<String, dynamic>> getDataByDocumentId(
      String collection, String documentId) async {
    try {
      DocumentSnapshot query =
          await _firestore.collection(collection).document(documentId).get();
      return query.data['role'];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
