// Login page for app.
import 'dart:convert';

import 'package:careconnect/screens/authenticate/signup.dart';
import 'package:careconnect/user/user.dart';
import 'package:flutter/material.dart';
import 'package:careconnect/services/auth.dart';
import 'package:careconnect/shared/loading.dart';
import 'package:careconnect/services/role_select.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  bool loading = false;
  String error = "";

  Roles roles = Roles();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // background Image
                Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/doctor.png'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.blue[200].withOpacity(0.8), BlendMode.srcOver),
                    ),
                  ),
                ),
                // Heart logo container
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment(-1, -1),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: AssetImage('assets/heart.png'),
                                  fit: BoxFit.fitHeight)),
                        ),
                        // Form Container
                        Container(
                          padding: EdgeInsets.all(14),
                          child: new Form(
                              key: loginformKey,
                              child: new Column(
                                children: <Widget>[
                                  //Email field
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'field can\'t be empty ';
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
                                        hintText: 'Email',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2.0))),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  //Password field
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'field can\'t be empty ';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    onChanged: (val) {
                                      setState(() {
                                        password = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue,
                                                width: 2.0))),
                                  ),
                                  // Forgot Password
                                  Row(
                                    children: <Widget>[
                                      StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Checkbox(
                                            value: isChecked,
                                            onChanged: (val) {
                                              setState(() {
                                                isChecked = val;
                                              });
                                            });
                                      }),
                                      Text('Forgot Password ?',
                                          style: TextStyle(fontSize: 17))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  // LoGin button
                                  SizedBox(
                                    width: double.infinity,
                                    child: RaisedButton(
                                      color: Colors.green,
                                      onPressed: () async {
                                        if (loginformKey.currentState
                                            .validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          // dynamic obj =
                                          //     await roles.getDataByDocumentId(
                                          //         'users', result.uid);
                                          // result.roleSet = obj['role'];
                                          // print(result.roleGet);
                                          if (result == null) {
                                            setState(() {
                                              error = 'could not sign in';
                                              loading = false;
                                            });
                                          } else {
                                            print("Login Sucessfull");
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      textColor: Colors.white,
                                      padding:
                                          EdgeInsets.fromLTRB(0, 13, 0, 13),
                                    ),
                                  ),
                                  Container(
                                    child: Text('New User ?'),
                                    height: 40,
                                    alignment: Alignment(0.0, 0.0),
                                  ),
                                  // Signup button
                                  SizedBox(
                                    width: double.infinity,
                                    child: RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signup()));
                                      },
                                      child: Text('Sign Up',
                                          style: TextStyle(fontSize: 17)),
                                      textColor: Colors.white,
                                      color: Colors.indigo[700],
                                      padding:
                                          EdgeInsets.fromLTRB(0, 13, 0, 13),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
