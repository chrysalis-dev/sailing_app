import 'package:flutter/material.dart';
import '../screens/boat_search.dart';

// SearchTypeButtons class is stateful
class SearchTypeButtons extends StatefulWidget {
  // immutable: parent widget and callback function
  final SearchBarWithSuggestions parent;
  final Function updateParent;

  // constructor takes values for parent and updateParent
  SearchTypeButtons(this.parent, {@required this.updateParent});

  _SearchTypeState createState() => _SearchTypeState();
}

// state class for SearchTypeButtons
class _SearchTypeState extends State<SearchTypeButtons> {
  int clickCount = 0;

  // function to build the button which changes and displays search type
  Widget typeButton(int c) {
    // get button statuses from parent - we'll need them to colour buttons
    int mode = c % 3;
    String type;
    switch(mode) {
      case 0: type = "Contains"; break;
      case 1: type = "Begins with"; break;
      case 2: type = "Ends in"; break;
    }

    switch(mode) {
      case 0:
        widget.parent.setSearchType("contains");
        break;
      case 1:
        widget.parent.setSearchType("start");
        break;
      case 2:
        widget.parent.setSearchType("end");
        break;
    }

    return RaisedButton(
        child: Text("Search type:\n" + type, style: TextStyle(color: Colors.white),),
        // set colour based on current status for this button
        color: Colors.blue,
        // on button press, set search type and button status, then
        // tell parent to refresh itself
        onPressed: () {
          this.clickCount++;
          widget.updateParent();
        }
    );
  }

  // function to build button which sets final lap
  Widget finalLapButton() {
    return RaisedButton(
      child: Text("FINAL LAP"),
      color:
      (widget.parent.checkFinalLap())
          ? Colors.blue
          : null,
      onPressed: () {
        widget.parent.setFinalLap(true);
        widget.updateParent();
      },
    );
  }

  // build method defines how widget is represented in GUI
  @override
  Widget build(BuildContext context) {
    return Container( // wrap in container for sizing purposes
      padding: EdgeInsets.all(0),
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          typeButton(clickCount),
          finalLapButton()
        ],
      )
    );
  }
}