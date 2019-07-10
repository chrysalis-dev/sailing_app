import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sailing_app/models/boat.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/models/competitor.dart';
import 'package:sailing_app/models/race_result.dart';
import 'package:sailing_app/screens/boat_search.dart';

class RaceItem extends StatelessWidget {
  final int index;
  final Competition competition;

  RaceItem({Key key, this.index, this.competition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('xD'),
      child: Card(
        child: Container(
          child: ListTile(
            onTap: () {
/*
change this later once database is used. starting here...
*/
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
/*
... ending here
*/
              Navigator.of(context).pushNamed(
                SearchBarWithSuggestions.routeName,
                arguments: c,
              );
            },
            title: Text(competition.races[index].raceID.toString()),
          ),
        ),
      ),
      onDismissed: (context) {
        competition.races.remove(competition.races[index]);
      },
    );
  }
}
