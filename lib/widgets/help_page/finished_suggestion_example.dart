import 'package:flutter/material.dart';

// widget draws example of suggestion for boat who's finished race for help page
class FinishedSuggestionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child:     SizedBox(
        child: Card(
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Boat number:"),
                Container(height: 50, child: VerticalDivider(),),
              ],),
            title: Text("12345"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(height: 50, child: VerticalDivider(),),
                RawMaterialButton(
                  shape: CircleBorder(),
                  fillColor: Colors.black26,
                  constraints: BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 50,
                      minHeight: 50,
                      minWidth: 50
                  ),
                  onPressed: null,
                  child: Text("DONE"),
                ),

              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) =>
                    AlertDialog(
                      content: (
                          Text("This is a boat which has finished the race. It "
                              "will be automatically pushed to the bottom of the "
                              "search results so it doesn't get your way.")
                      ),
                    ),
              );
            },
          ),
          color: Colors.white30,
        ),
      ),
    );
  }
}