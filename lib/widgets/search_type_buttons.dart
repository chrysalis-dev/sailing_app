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
  // build method defines how widget is represented in GUI
  @override
  Widget build(BuildContext context) {
    // get button statuses from parent - we'll need them to colour buttons
    List<bool> buttonStatuses = widget.parent.getButtonStatuses();

    return Container( // wrap in container for sizing purposes
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20)),
          Text("Search Type:",
            style: new TextStyle(color: Colors.blue, fontSize: 20.0),),

          // consists of ButtonBar which contains the three buttons
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                  child: Text("CONTAINS"),
                  // set colour based on current status for this button
                  color: buttonStatuses[0] ? Colors.grey : null,
                  // on button press, set search type and button status, then
                  // tell parent to refresh itself
                  onPressed: () {
                    widget.parent.setSearchType("middle");
                    widget.parent.setButtonStatuses([true, false, false]);
                    widget.updateParent();
                  }
              ),
              new RaisedButton(
                  child: Text("X____"),
                  color: buttonStatuses[1] ? Colors.grey : null,
                  onPressed: () {
                    widget.parent.setSearchType("start");
                    widget.parent.setButtonStatuses([false, true, false]);
                    widget.updateParent();
                  }
              ),
              new RaisedButton(
                  child: Text("____X"),
                  color: buttonStatuses[2] ? Colors.grey : null,
                  onPressed: () {
                    widget.parent.setSearchType("end");
                    widget.parent.setButtonStatuses([false, false, true]);
                    widget.updateParent();
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}