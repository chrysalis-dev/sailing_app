import 'package:flutter/material.dart';
import 'package:sailing_app/screens/boat_search.dart';
import 'screens/start_page.dart';
import 'data_classes/search_screen_arguments.dart';

void main() => runApp(MyApp());

// starting point of app
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "textbox using inbuilt keyboard",
      // Scaffold lets us use AppBar at top, floating buttons and bottom bar
      home: StartPage(),
      routes: <String, WidgetBuilder> {
        'startPage': (BuildContext context) => new StartPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == SearchBarWithSuggestions.routeName) {
          final SearchScreenArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return SearchBarWithSuggestions(args); }
          );
        }
      },
    );
  }
}