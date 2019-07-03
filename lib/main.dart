import 'package:flutter/material.dart';
import 'package:sailing_app/screens/boat_search.dart';
import 'screens/help_page.dart';
import 'models/competitor.dart';

void main() => runApp(MyApp());

// starting point of app
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "textbox using inbuilt keyboard",
      // Scaffold lets us use AppBar at top, floating buttons and bottom bar
      home: HelpPage(true),
      routes: <String, WidgetBuilder> {
        'helpPage': (BuildContext context) => new HelpPage(false),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == SearchBarWithSuggestions.routeName) {
          final List<Competitor> args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return SearchBarWithSuggestions(args); }
          );
        }
      },
    );
  }
}