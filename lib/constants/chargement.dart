import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chargement extends StatefulWidget {
  @override
  _ChargementState createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/BackgroundImage.jpg"),
    fit: BoxFit.cover
    )
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 200.0, width: 200.0),
              SizedBox(height: 10.0),
              SpinKitPulse(
                color: Colors.blueAccent,
                size: 50.0,
              )
            ],
          ),
    ),
    )
    );
  }
}
