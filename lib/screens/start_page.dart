import 'package:flutter/material.dart';
import 'boat_search.dart';
import '../data_classes/search_screen_arguments.dart';
import '../data_classes/competitor.dart';
import 'dart:math';
import '../data_classes/boat.dart';
import '../data_classes/race_result.dart';

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Competitor> c = [];
    var random = new Random();
    for(var i = 0; i < 200; i++) { // build 200 random boats for now
      var n = random.nextInt(100000);
      c.add(Competitor(
          boat: Boat(n, "", "", 0, ""),
          result: RaceResult(n, 0, 0, 0, 0, 0, "")
      ));
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text("searching for boats..."),
      ),
      body: RaisedButton(
        child: Text("Start Race"),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(
              SearchBarWithSuggestions.routeName,
              arguments: SearchScreenArguments(DateTime.now(), c, 5)
          );
          },
      ),
    );
  }

}