import 'package:flutter/material.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/models/Competition.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_list.dart';

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
      body: CompetitionList(competitions: Competitions.competitions),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fml(context);
        },
        tooltip: 'Add Competition',
        child: Icon(Icons.add),
      ),
    );
  }

  Future _fml(BuildContext context) async {
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
