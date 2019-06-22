import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';

import 'competition_item.dart';

class CompetitionList extends StatelessWidget {
  final List<Competition> competitions;

  CompetitionList({Key key, @required this.competitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: competitions.length,
      itemBuilder: (context, index) {
        return CompetitionItem(
          endDate: competitions[index].startDate,
          startDate: competitions[index].endDate,
          name: competitions[index].name,
        );
      },
    );
  }
}
