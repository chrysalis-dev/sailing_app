import 'package:flutter/material.dart';
import '../../models/competitor.dart';
import 'package:sailing_app/screens/boat_search.dart';

// SuggestionsDropdown class is stateful
class SuggestionsDropdown extends StatefulWidget {
  // immutable values - parent widget and callback list of competitors
  final SearchBarWithSuggestions parent;
  final List<Competitor> competitors;

  // the constructor takes the parent widget, list of competitors and start time
  SuggestionsDropdown(this.parent, this.competitors);

  _SuggState createState() => _SuggState();
}

// state class for SuggestionsDropdown
class _SuggState extends State<SuggestionsDropdown> {
  // mutable values:
  List<Competitor> suggCompetitors =
      new List<Competitor>(); // list of suggested boats
  List<Widget> suggWidgets =
      new List<Widget>(); // list of widgets built from suggestions
  RegExp pattern; // regex pattern used to search

  // method to update list of suggestions based on user input
  void updateSuggestions() {
    suggCompetitors = [];
    // on bracket inputs this crashes because RegExp can't parse - wrapped in TRY
    try {
      // set the relevant RegExp based on the type of search we want to do
      switch (widget.parent.searchType) {
        case "start":
          {
            pattern = RegExp('^' + widget.parent.inputString);
          }
          break;
        case "contains":
          {
            pattern = RegExp(widget.parent.inputString);
          }
          break;
        case "end":
          {
            pattern = RegExp(widget.parent.inputString + r'$');
          }
          break;
      }

      // for each boat, if there's a match add it to the list of suggestions
      for (Competitor c in widget.competitors) {
        if (pattern.hasMatch(c.boat.boatID.toString())) {
          suggCompetitors.add(c);
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    } // output any errors
  }

  // card for boats in a non-final lap
  Widget normalCard(Competitor c) {
    return SizedBox(
      child: Card(
        child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Boat number:"),
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
              ],
            ),
            title: Text(c.boat.boatID.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
                RawMaterialButton(
                  shape: CircleBorder(),
                  elevation: 2,
                  fillColor: Colors.lightGreen[200],
                  constraints: BoxConstraints(
                      maxHeight: 50, maxWidth: 50, minHeight: 50, minWidth: 50),
                  onPressed: () {
                    c.registerLap(DateTime.now());
                    setState(() {});
                  },
                  child: Text("LAP " + (c.results.laps + 1).toString()),
                ),
              ],
            )),
        color: Colors.white70,
      ),
    );
  }

  // card for boats in the final lap
  Widget finalCard(Competitor c) {
    return SizedBox(
      child: Card(
        child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Boat number:"),
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
              ],
            ),
            title: Text(c.boat.boatID.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
                RawMaterialButton(
                  shape: CircleBorder(),
                  elevation: 2,
                  fillColor: Colors.lightGreen[400],
                  constraints: BoxConstraints(
                      maxHeight: 50, maxWidth: 50, minHeight: 50, minWidth: 50),
                  onPressed: () {
                    c.registerLap(DateTime.now());
                    c.finished;
                    setState(() {});
                  },
                  child: Text("END"),
                ),
              ],
            )),
        color: Colors.white70,
      ),
    );
  }

  // card for boats which have finished the race
  Widget finishedCard(Competitor c) {
    return SizedBox(
      child: Card(
        child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Boat number:"),
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
              ],
            ),
            title: Text(c.boat.boatID.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 50,
                  child: VerticalDivider(),
                ),
                RawMaterialButton(
                  shape: CircleBorder(),
                  fillColor: Colors.black26,
                  constraints: BoxConstraints(
                      maxHeight: 50, maxWidth: 50, minHeight: 50, minWidth: 50),
                  onPressed: null,
                  child: Text("DONE"),
                ),
              ],
            )),
        color: Colors.white30,
      ),
    );
  }

  // method to create the list of suggestion widgets from the input and list
  drawSuggestions() {
    suggWidgets = [];
    // only do this if there ARE some suggestions, to save time for empty input
    if (suggCompetitors != null) {
      suggCompetitors.sort();
      for (Competitor c in suggCompetitors) {
        if (!widget.parent.finalLap) {
          suggWidgets.add(normalCard(c));
        } else if (c.finished) {
          suggWidgets.add(finishedCard(c));
        } else {
          suggWidgets.add(finalCard(c));
        }
      }
    }
  }

  // build method determines widget's GUI representation
  @override
  Widget build(BuildContext context) {
    debugPrint("just drew suggestions drawer");
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
            renders all of them. More efficient this way, especially for large
            lists */
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
