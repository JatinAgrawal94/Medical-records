import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:careconnect/user/user.dart';

class Roles {
  Firestore _firestore = Firestore.instance;

  void addUser(dynamic result) {
    _firestore
        .collection('users')
        .document(result.uid)
        .setData({"email": result.email, "role": result.role}).then(
            (value) => print("User added"));
  }

  Future getDataByDocumentId(String collection, String documentId) async {
    try {
      DocumentSnapshot query =
          await _firestore.collection(collection).document(documentId).get();
      return query.data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
