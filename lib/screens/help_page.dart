import 'package:flutter/material.dart';
import 'boat_search.dart';
import '../models/competitor.dart';
import 'dart:math';
import '../models/boat.dart';
import '../models/race_result.dart';
import '../widgets/help_page/search_buttons_example.dart';
import '../widgets/help_page/racing_suggestion_example.dart';
import '../widgets/help_page/finished_suggestion_example.dart';
import '../widgets/help_page/search_bar_example.dart';

class HelpPage extends StatelessWidget {
  static const routeName = 'screen4';

  List<Widget> basicSkeleton() {
    return [
      Card(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Here you can see how to use the app UI. Click the green button at the bottom to go back to the race!",
          style: TextStyle(fontSize: 16),
        ),
      )),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      SearchButtonsExample(),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      Text("This is the search bar:"),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      SearchBarExample(),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      Text("This is a search suggestion:"),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      RacingSuggestionExample(),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      Text("This is the suggestion for a boat which has finished the race:"),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
      FinishedSuggestionExample(),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
      ),
    ];
  }

  List<Widget> continueButton(BuildContext context) {
    return [
      Text("Click below to continue the race"),
      RaisedButton(
        color: Colors.green[400],
        child: Text("Continue Race"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Competitor> c = [];
    var random = new Random();
    for (var i = 0; i < 200; i++) {
      // build 200 random boats for now
      var n = random.nextInt(100000);
      c.add(Competitor(
        boat: Boat(n, "", "", 0, ""),
        results: RaceResult(n, 0, 0, 0, 0, 0, ""),
      ));
    }
    return new Scaffold(
        appBar: AppBar(
          title: Text("Smooth Sailing Help"),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
                children: List.from(basicSkeleton())
                  ..addAll(continueButton(context)))));
  }
}
