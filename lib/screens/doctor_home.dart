import 'package:flutter/material.dart';
import 'package:careconnect/services/auth.dart';

class DoctorHome extends StatefulWidget {
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jatin'),
        actions: [
          RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            color: Colors.blue,
            child: Text('Logout'),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text("This is the doctor"),
        ),
      ),
    );
  }
}
