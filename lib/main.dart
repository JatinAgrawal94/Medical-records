import 'package:careconnect/services/auth.dart';
import 'package:careconnect/shared/loading.dart';
import 'package:careconnect/user/user.dart';
import 'package:careconnect/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value:AuthService().user,
        child: MaterialApp(home: Wrapper()));

  }
}
