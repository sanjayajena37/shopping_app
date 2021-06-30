import 'package:flutter/material.dart';
import 'package:shooping_app/scoped-model/MainModel.dart';
import 'package:shooping_app/screens/DashboardScreen.dart';
import 'package:shooping_app/screens/DetailsScreen.dart';
import 'package:shooping_app/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Monte"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        model: _model,
      ),
      routes: {
        "/home": (context) => DashboardScreen(
              model: _model,
            ),
        "/details": (context) => DetailsScreen(
              model: _model,
            ),
      },
    );
  }
}
