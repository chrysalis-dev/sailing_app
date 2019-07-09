import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/screens/competition_screen.dart';

class CompetitionItem extends StatelessWidget {
  final Competition competition;

  CompetitionItem({
    Key key,
    @required this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: new Key('k'),
      onDismissed: (context) async {
        Competitions().removeCompetition(competition);
      },
      child: GestureDetector(
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 20),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ))),
                child: Icon(
                  Icons.directions_boat,
                  size: 64,
                ),
              ),
              title: Text(competition.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(new DateFormat("MMMM d, y 'at' HH:mm")
                      .format(competition.startDate)
                      .toString()),
                  Text(new DateFormat("MMMM d, y 'at' HH:mm")
                      .format(competition.endDate)
                      .toString()),
                ],
              ),
              isThreeLine: true,
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 56,
              ),
            ),
          ),
        ),
        onTap: () {
          debugPrint('Pressed');
          Navigator.pushNamed(
            context,
            CompetitionScreen.routeName,
            arguments: competition,
          );
        },
      ),
    );
  }
}
