import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';
import 'package:sailing_app/widgets/dti.dart';

class CompIt extends StatelessWidget {
  final Competition competition;

  CompIt({Key key, @required this.competition}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              child: new Divider(color: Colors.black),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 20),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ))),
                child: Icon(
                  Icons.edit,
                ),
              ),
              title: TextField(
                decoration: const InputDecoration(
                    labelText: 'Competition name', filled: true),
                onChanged: (String value) {
                  competition.name =
                      value.isNotEmpty ? value : competition.name;
                },
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 20),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ))),
                child: Icon(
                  Icons.calendar_today,
                ),
              ),
              title: DateTimeItem(
                dateTime: competition.startDate,
                onChanged: (DateTime value) {
                  competition.startDate = value;
                },
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 20),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ))),
                child: Icon(
                  Icons.calendar_today,
                ),
              ),
              title: DateTimeItem(
                dateTime: competition.endDate,
                onChanged: (DateTime value) {
                  competition.endDate = value;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: new Divider(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
