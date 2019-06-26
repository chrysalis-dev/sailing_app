import 'package:flutter/material.dart';
import 'package:sailing_app/data_classes/competitor.dart';
import 'package:sailing_app/screens/boat_search.dart';

// SuggestionsDropdown class is stateful
class SuggestionsDropdown extends StatefulWidget {
  // immutable values - parent widget and callback list of competitors
  final SearchBarWithSuggestions parent;
  final List<Competitor> competitors;
  final DateTime startTime;
  final int numOfLaps;

  // the constructor takes the parent widget, list of competitors and start time
  SuggestionsDropdown(this.parent, this.competitors, this.startTime, this.numOfLaps);

  _SuggState createState() => _SuggState();
}

// state class for SuggestionsDropdown
class _SuggState extends State<SuggestionsDropdown> {
  // mutable values:
  List<Competitor> suggCompetitors = new List<Competitor>(); // list of suggested boats
  List<Widget> suggWidgets = new List<Widget>(); // list of widgets built from suggestions
  RegExp pattern; // regex pattern used to search

  // method to update list of suggestions based on user input
  void updateSuggestions(){
    suggCompetitors = [];
    // on bracket inputs this crashes because RegExp can't parse - wrapped in TRY
    try{
      // set the relevant RegExp based on the type of search we want to do
      switch (widget.parent.getSearchType()) {
        case "start": {
          pattern = RegExp('^' + widget.parent.getInputString());
        } break;
        case "middle": {
          pattern = RegExp(widget.parent.getInputString());
        } break;
        case "end": {
          pattern = RegExp(widget.parent.getInputString() + r'$');
        } break;
      }

      // for each boat, if there's a match add it to the list of suggestions
      for(Competitor c in widget.competitors) {
        if (pattern.hasMatch(c.boat.boatID.toString())){
          suggCompetitors.add(c);
        }
      }
    } on Exception catch(e) { debugPrint(e.toString()); } // output any errors
  }

  // method to create the list of suggestion widgets from the input and list
  drawSuggestions() {
    suggWidgets = [];
    // only do this if there ARE some suggestions, to save time for empty input
    if (suggCompetitors != null) {
      suggCompetitors.sort();
      for (Competitor c in suggCompetitors) {
        if (c.lapCount < widget.numOfLaps) {
          suggWidgets.add(
              SizedBox(
                child: Card(
                  child: ListTile(
                    leading: Text(
                        (c.lapCount == 0)
                            ? "No laps"
                            : "Laps: " + (c.lapCount).toString()
                    ),
                    title: Text(c.boat.boatID.toString() + (
                        (c.lapCount == 0)
                          ? ""
                          : "\nLast lap - " + c.printLastLap())
                    ),
                    trailing: RawMaterialButton(
                      shape: CircleBorder(),
                      elevation: 2,
                      fillColor: Colors.lightGreen[
                        (c.lapCount == (widget.numOfLaps - 1))
                            ? 400
                            : 200
                      ],
                      constraints: BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 50,
                        minHeight: 50,
                        minWidth: 50
                      ),
                      onPressed: () {
                        (c.lapCount == 0)
                            ? c.registerLap(DateTime.now(), widget.startTime)
                            : c.registerLap(DateTime.now(), c.lastLapTime);
                        setState(() {});
                      },
                      child: Text(
                          (c.lapCount == (widget.numOfLaps - 1))
                              ? "END"
                              : "LAP"/*Icon(Icons.check)*/
                      ),
                     ),
                  ),
                  color: Colors.white70,
                ),
              )
          );
        }
        else {
          suggWidgets.add(
              SizedBox(
                child: Card(
                  child: ListTile(
                    leading: Text("DONE"),
                    title: Text(
                        c.boat.boatID.toString(),
                        style: TextStyle(color: Colors.red[400])
                    ),
                  ),
                  color: Colors.white70,
                ),
              )
          );
        }
      }}
  }

  // build method determines widget's GUI representation
  @override
  Widget build(BuildContext context) {
    updateSuggestions();
    drawSuggestions();

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          top: 0,
          left: 30,
          right: 30,
          bottom: 20,
        ),
        /* ListView.builder only renders on-screen elements while ListView
            alone doesn't. More efficient this way, especially for large lists*/
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: suggWidgets.length,
          itemBuilder: (context, index) {
            return suggWidgets[index];
          },
        ),
      ),
    );
  }
}