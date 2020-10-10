import 'package:careconnect/services/auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          RaisedButton(
            onPressed: ()async{
                await _auth.signOut(); 
            },
            color: Colors.blue,
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
