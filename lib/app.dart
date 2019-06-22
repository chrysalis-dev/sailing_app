import 'package:flutter/material.dart';
import 'package:sailing_app/routes/routes.dart';
import 'package:sailing_app/screens/home_screen.dart';

class App extends StatefulWidget {
  final String title;

  App({Key key, @required this.title}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        Routes.home: (context) {
          return HomeScreen(title: 'Some Text');
        },
        Routes.addCompetition: (context) {
          return null;
        }
      },
    );
  }
}
