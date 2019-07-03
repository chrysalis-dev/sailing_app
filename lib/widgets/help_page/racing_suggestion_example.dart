import 'package:flutter/material.dart';

// widget draws example suggestion of boat currently racing for help page
class RacingSuggestionExample extends StatelessWidget {
  // method draws dialog explaining what the suggestion is
  void showInformation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: (Text("This is a search suggestion. In the middle is "
            "the boat number of the suggested boat. On the right is "
            "the button you press in order to say that that boat "
            "has completed a lap. This button also shows the current "
            "lap that boat is on. When the boat is on its last lap, "
            "the button will change to display the word \"END\"")
        ),
      ),
    );
  }

  // build card with boat number 12345 and 1 lap
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Card(
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Boat number:"),
                Container(height: 50, child: VerticalDivider(),),
              ],
            ) ,
            title: Text(12345.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(height: 50, child: VerticalDivider(),),
                RawMaterialButton(
                  shape: CircleBorder(),
                  elevation: 2,
                  fillColor: Colors.lightGreen[200],
                  constraints: BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                      minHeight: 50,
                      minWidth: 50
                  ),
                  // if user clicks button, show information dialog
                  onPressed: () { showInformation(context); },
                  child: Text("LAP 1"),
                ),
              ],
            ),
            // if user clicks anywhere on card, draw information dialog
            onTap: () { showInformation(context); },
          ),
          color: Colors.white70,
        ),
      ),
    );
  }
}