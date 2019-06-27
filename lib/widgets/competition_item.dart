import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';
import 'package:sailing_app/screens/competition_screen.dart';

class CompetitionItem extends StatelessWidget {
  final Competition competition;

  CompetitionItem({
    Key key,
    @required this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.directions_boat, size: 56),
          title: Text(competition.name),
          subtitle: Text(competition.toString()),
          trailing: Icon(Icons.more_vert),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CompetitionScreen(competition: competition)));
      },
    );
  }
}
