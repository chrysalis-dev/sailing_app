import 'package:flutter/material.dart';
import 'boat_search.dart';
import '../models/competitor.dart';
import 'dart:math';
import '../models/boat.dart';
import '../models/race_result.dart';

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Competitor> c = [];
    DateTime now = DateTime.now();
    var random = new Random();
    for(var i = 0; i < 200; i++) { // build 200 random boats for now
      var n = random.nextInt(100000);
      c.add(Competitor(
          boat: Boat(n, "", "", 0, ""),
          results: RaceResult(n, 0, 0, 0, 0, 0, ""),
          startTime: now
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
              arguments: c
          );
          },
      ),
    );
  }
}