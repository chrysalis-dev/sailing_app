import 'package:flutter/material.dart';
import 'package:sailing_app/screens/home.dart';

void main() => runApp(MyApp()); // THE WORKING ONE WITH RETURNING VALUES

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sailing Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sailing App'),
    );
  }
}
