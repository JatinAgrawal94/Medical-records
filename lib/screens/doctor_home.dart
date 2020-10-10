import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jatin'),
      ),
      body: Center(
        child: Text("This is the doctor"),
      ),
    );
  }
}
