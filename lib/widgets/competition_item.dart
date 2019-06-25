import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';

class CompetitionItem extends StatelessWidget {
  final Competition competition;

  CompetitionItem({
    Key key,
    @required this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.directions_boat, size: 56),
        title: Text(competition.name),
        subtitle: Text(competition.toString()),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
