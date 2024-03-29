import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/models/race.dart';
import 'package:sailing_app/widgets/albert_temp_folder/dti.dart';
import 'package:sailing_app/widgets/albert_temp_folder/race_list.dart';

class CompIt extends StatefulWidget {
  static const routeName = '/compit';
  final Competition competition;

  CompIt({Key key, @required this.competition}) : super(key: key);

  @override
  _CompItState createState() => _CompItState();
}

class _CompItState extends State<CompIt> {
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
                  setState(() {
                    widget.competition.name =
                        value.isNotEmpty ? value : widget.competition.name;
                  });
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
                dateTime: widget.competition.startDate,
                onChanged: (DateTime value) {
                  setState(() {
                    widget.competition.startDate = value;
                  });
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
                dateTime: widget.competition.endDate,
                onChanged: (DateTime value) {
                  setState(() {
                    widget.competition.endDate = value;
                  });
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
            Expanded(
                child: RaceList(
              competition: widget.competition,
            )),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.competition.races.add(new Race(DateTime.now()));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
