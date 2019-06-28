import 'package:flutter/material.dart';
import 'package:sailing_app/models/Race.dart';

class RaceItem extends StatelessWidget {
  final Race race;

  const RaceItem({Key key, this.race}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('xD'),
      child: Card(
        child: Container(
          child: ListTile(
            title: Text(race.raceID),
          ),
        ),
      ),
    );
  }
}
