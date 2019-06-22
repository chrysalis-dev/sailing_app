import 'package:flutter/material.dart';

class CompetitionItem extends StatelessWidget {
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  CompetitionItem({
    Key key,
    @required this.name,
    @required this.startDate,
    @required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.directions_boat, size: 56),
        title: Text(name),
        subtitle: Text('Do the date displaying\nOn two lines'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
