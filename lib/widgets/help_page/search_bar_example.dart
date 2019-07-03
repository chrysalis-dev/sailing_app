import 'package:flutter/material.dart';

// widget draws example search bar for help page
class SearchBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell( // InkWell lets us use onTap on a Container
            child: Container( // all wrapped in a container for size control ability
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 0,
                left: 30,
                right: 30,
              ),
              child: new Container(
                  child: new Center(
                    // Column consists of "search type" title and the bar itself
                    child: new Column(
                        children : [
                          new Text('Enter boat number:',
                            style: new TextStyle(color: Colors.blue, fontSize: 20.0),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 30),),
                          new Container(height: 2, color: Colors.blue,),
                          Padding(padding: EdgeInsets.only(bottom: 10),),
                        ]
                    ),
                  )
              )
            ),
          onTap: () {
            // when the card is clicked, open information dialog
            showDialog(
              context: context,
              builder: (_) =>
                  AlertDialog(
                    content: (
                        Text("This is the search bar, into which you can type "
                            "a boat number. Every time you type something, the "
                            "suggestions will give you options of boats which "
                            "you can record laps for. Only numbers can be typed "
                            "into the search box.")
                    ),
                  ),
            );
          },
        )
    );
  }
}
