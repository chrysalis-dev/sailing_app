import 'package:flutter/material.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/widgets/competition_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
      body:
          CompetitionList(competitions: Competitions.competitions), // ADD BODY
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fml(context);
        }, // ADD ASYNC METHOD
        tooltip: 'Add Competition',
        child: Icon(Icons.add),
      ),
    );
  }

  void _fml(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompDialog(), fullscreenDialog: true));
    setState(() {
      if (result is Competition) {
        Competitions.competitions.add(result);
      }
    });
  }
}
