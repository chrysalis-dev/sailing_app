import 'package:flutter/material.dart';
import 'package:sailing_app/screens/boat_search.dart';

void main() => runApp(MyApp());

// starting point of app
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "textbox using inbuilt keyboard",
        // Scaffold lets us use AppBar at top, floating buttons and bottom bar
        home: Scaffold(
          appBar: AppBar(
            title: Text("searching for boats..."),
          ),
          body: SearchBarWithSuggestions(100),
        )
    );
  }
}