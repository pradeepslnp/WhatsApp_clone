import 'package:flutter/material.dart';
import 'screens/homescrren.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: Color(0xFF075E54),
          accentColor: Color(0xFF128C7E)),
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
