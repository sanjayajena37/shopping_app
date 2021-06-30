import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shooping_app/scoped-model/MainModel.dart';
import 'package:shooping_app/utils/Const.dart';

class SplashScreen extends StatefulWidget {
  final MainModel model;

  const SplashScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    callResourceTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Const.colors[1],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        "assets/bags/bag_2.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "SHOPPING",
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          //fontFamily: "MonteMed",
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "With Skillmine",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          //fontFamily: "MonteMed",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "©Copyright with symbol",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      //fontFamily: "MonteMed",
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void callResourceTimer() {
    Timer(Duration(seconds: 5), navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
}
