import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_expanded.dart';

class CompetitionScreen extends StatefulWidget {
  static const routeName = '/screen2';
  final Competition competition;

  CompetitionScreen({Key key, @required this.competition}) : super(key: key);

  @override
  _CompetitionScreenState createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.competition.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              return Navigator.pop(context);
            },
          ),
        ],
      ),
      body: CompIt(competition: widget.competition),
    );
  }
}
