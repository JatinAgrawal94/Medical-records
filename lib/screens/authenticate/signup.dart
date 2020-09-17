// Signup Page for App
// Contents : name,email,phone,age,address
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  @override
  State createState() => SignupState();
}

class SignupState extends State<Signup> {
  int gender;
  final patientSignUp = GlobalKey<FormState>();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    gender = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/doctor.png'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.blue[50].withAlpha(240), BlendMode.srcOver))),
          ),
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 35, 0, 35),
                        child: Text('Create Profile',
                            style: GoogleFonts.ubuntu(fontSize: 50)),
                      )
                    ],
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter Email',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Phone", border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 25),
                        child:TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText:"Password", border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 40),
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text('Get Started'),
                          onPressed: () {
                            if (patientSignUp.currentState.validate()) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Profile Created')));
                            }
                          },
                        ),
                      )
                    ],
                  ))
                ]),
          )
        ],
      ),
    );
  }
}
