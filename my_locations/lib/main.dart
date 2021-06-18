import 'package:flutter/material.dart';

import 'package:my_locations/models/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "My Locations",
        theme: new ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: new MainScreen());
  }
}

// ignore: must_be_immutable
