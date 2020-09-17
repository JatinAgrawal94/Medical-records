// Login page for app.
import 'package:flutter/material.dart';
import 'package:careconnect/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final loginformKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return new Scaffold(
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
                          child: new Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'field can\'t be empty ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'field can\'t be empty ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder()),
                          ),
                          // Forgot Password
                          Row(
                            children: <Widget>[
                              StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
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
                                // if (loginformKey.currentState.validate()) {
                                //   Scaffold.of(context).showSnackBar(SnackBar(
                                //       content: Text('LogIn Succesfull'))
                                //       );
                                // }
                                dynamic result = await _auth.signinAnon();
                                if (result == null) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          'Incorrect username or password')));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('SignIn Successful')));
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 17),
                              ),
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
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
                              onPressed: () {},
                              child: Text('Sign Up',
                                  style: TextStyle(fontSize: 17)),
                              textColor: Colors.white,
                              color: Colors.indigo[700],
                              padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
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
