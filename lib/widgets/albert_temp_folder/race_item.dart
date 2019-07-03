import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';
import '../../screens/help_page.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpPage(true)),
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
