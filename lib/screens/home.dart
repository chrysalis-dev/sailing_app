import 'package:flutter/material.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_list.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/';
  MyHomePage({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CompetitionList(
        competitions: Competitions.competitions,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDataFromDialog(context);
        },
        tooltip: 'Add Competition',
        child: Icon(Icons.add),
      ),
    );
  }

  Future getDataFromDialog(BuildContext context) async {
    final data = await Navigator.of(context).pushNamed(CompDialog.routeName);
    setState(() {
      if (data is Competition) {
        Competitions.competitions.add(data);
      }
    });
  }
}
