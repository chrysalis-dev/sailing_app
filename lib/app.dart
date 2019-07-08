import 'package:flutter/material.dart';
import 'package:sailing_app/routes/route_generator.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Sailing',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
