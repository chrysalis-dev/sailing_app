import 'package:flutter/material.dart';

// widget draws example search buttons for help page
class SearchButtonsExample extends StatelessWidget {

  // method draws the 'type' button and assigns onClick information dialog
  Widget typeButton(BuildContext context) {
    return Column(
      children: <Widget> [
        Text("Search type:"),
        RaisedButton(
          child: Text("CONTAINS", style: TextStyle(color: Colors.white),),
          // set colour based on current status for this button
          color: Colors.blue,
          // on button press, set search type and button status, then
          // tell parent to refresh itself
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
              content: RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[ // TextSpan lets us use different text formats in one child
                    new TextSpan(text: "This button lets you change which search mode you "
                        "are in. There are three search modes:\n\n"
                        "  • "),
                    new TextSpan(text: "CONTAINS", style: new TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " - shows all boats whose numbers contain your "
                        "search input\n"
                        "  • "),
                    new TextSpan(text: "STARTS WITH", style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(text: " - shows all boats whose numbers start with your "
                        "search input\n"
                        "  • "),
                    new TextSpan(text: "ENDS IN", style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(text: " - shows all boats whose numbers end in your search "
                        "input"),
                  ],
                ),
              )

            ),
            );
          },
        )
      ],
    );
  }

  // method draws 'final lap' button and assigns onClick information dialog
  Widget finalLapButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(""),
        RaisedButton(
          child: Text("FINAL LAP"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                  content: Text("Press this button once the final lap of the race "
                      "has begun. Once it's pressed, the current lap of all boats "
                      "will be their final one.")
              ),
            );
          },
        )
      ],
    )
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container( // wrap in container for sizing purposes
        padding: EdgeInsets.all(0),
        child: Card(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              typeButton(context),
              finalLapButton(context)
            ],
          ),
        )
    );
  }
}
