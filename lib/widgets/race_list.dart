import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';
import 'package:sailing_app/widgets/race_item.dart';

class RaceList extends StatelessWidget {
  final Competition competition;

  RaceList({
    Key key,
    @required this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: competition.races.length,
      itemBuilder: (context, index) {
        return RaceItem(
          race: competition.races[index],
        );
      },
    );
  }
}
