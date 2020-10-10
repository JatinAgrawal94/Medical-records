// Signup Page for App
// Contents : name,email,phone,age,address
import 'package:careconnect/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:careconnect/services/role_select.dart';

class Signup extends StatefulWidget {
  @override
  State createState() => SignupState();
}

class SignupState extends State<Signup> {
  final _signupkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  String name = "";
  String email = "";
  String password = "";
  String phoneno = "";

  final roles = Roles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              //        Heading for SignUp
              Container(
                margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
                alignment: Alignment.topLeft,
                child: Text(
                  "SignUp",
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Form(
                key: _signupkey,
                child: Column(
                  children: <Widget>[
                    //    Name Input box
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    //    Email Input box
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Enter Email',
                            border: OutlineInputBorder()),
                      ),
                    ),

                    //  Phone Number Input box
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            phoneno = val.toString();
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Phone", border: OutlineInputBorder()),
                      ),
                    ),
                    //  Password Input Box
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 6) {
                            return "Enter a password of min 6 chars long";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Password", border: OutlineInputBorder()),
                      ),
                    ),
                    // Get started button
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 40),
                      child: RaisedButton(
                          color: Colors.blue,
                          child: Text('Get Started'),
                          onPressed: () async {
                            if (_signupkey.currentState.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              roles.addUser(result);
                              Navigator.pop(context);
                            }
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
