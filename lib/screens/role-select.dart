// Single Page that selects the role of user: doctor or patient.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Roles extends StatefulWidget {
  @override
  State createState() => RolesState();
}

class RolesState extends State<Roles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //  Background Image
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/doctor.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.blue[200].withOpacity(0.8), BlendMode.srcOver))),
        ),
        //  Transparent AppBar
        Positioned(
            child: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        )),
        // Text
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 75, 0, 20),
              child: Text('You\'re',
                  style: GoogleFonts.pacifico(
                      fontSize: 100,
                      fontStyle: FontStyle.italic,
                      textStyle: TextStyle(letterSpacing: 5))),
            ),
            Container(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Image(
                            height: 190,
                            width: 190,
                            image: AssetImage('assets/doc-icon.png'),
                          ))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Image(
                            height: 190,
                            width: 190,
                            image: AssetImage('assets/patient.png'),
                          ))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Doctor',
                  style: GoogleFonts.prompt(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text('Patient',
                    style: GoogleFonts.prompt(
                        fontSize: 25, fontWeight: FontWeight.bold))
              ],
            )
          ],
        )
      ],
    ));
  }
}
