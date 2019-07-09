import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
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
              Navigator.pushNamed(
                context,
                SearchPage.routeName,
                arguments: competition.races[index],
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
