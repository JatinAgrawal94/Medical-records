import 'package:careconnect/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:careconnect/services/role_select.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Roles roles = Roles();
  String userRole;

  // user from firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid, email: user.email, role: userRole);
    } else {
      return null;
    }
  }

  // auth changes for user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // signin anon
  /*
  Future signinAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

//    Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  register with email and password check 1
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

//    signinwith email and password check 0
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      dynamic obj = await roles.getDataByDocumentId('users', user.uid);
      userRole = obj['role'];
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

//leverages in progress
