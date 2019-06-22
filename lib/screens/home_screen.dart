import 'package:flutter/material.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/widgets/competition_list.dart';

import 'competition_dialogue.dart';

class HomeScreen extends StatefulWidget {
  final String title;

//  final AppState appState;
//  final CompetitionAdder addCompetition;
//  final CompetitionRemover removeCompetition;
//  final CompetitionEditor editCompetition;
//   this.appState, this.addCompetition, this.removeCompetition, this.editCompetition

  const HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CompetitionList(competitions: Competitions.competitions),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompetitionDialogue(
                        title: 'New Competition',
                      )));
        },
        tooltip: 'Add Competition',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
