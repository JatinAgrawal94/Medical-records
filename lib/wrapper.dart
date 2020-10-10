import 'package:careconnect/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:careconnect/user/user.dart';
import 'package:careconnect/screens/home.dart';
import 'package:careconnect/screens/doctor_home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      print("User is $user");
      return Authenticate();
    } else {
      print(user.roleGet);
      if (user.roleGet == 'doctor') {
        return DoctorHome();
      } else {
        return Home();
      }
    }
  }
}
