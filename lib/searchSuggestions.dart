import 'package:flutter/material.dart';

// main method to run app
void main() => runApp(new MyApp());

// starting point of app
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "textbox using inbuilt keyboard",
        // Scaffold lets us use AppBar at top, floating buttons and bottom bar
        home: Scaffold(
          appBar: AppBar(
            title: Text("searching for boats..."),
          ),
          body: SearchBarWithSuggestions(),
            )
        );
  }
}

// _searchType indicates current type of search mode (contains/start/end)
//             has a setter and getter
String _searchType = "";
String getSearchType() {return _searchType;}
void setSearchType(String s) {_searchType = s;}

// the main Widget in this view is stateful
class SearchBarWithSuggestions extends StatefulWidget {
  //immutable constants: list of possible boat numbers
  final List<int> competitors = [12343, 6534, 8756, 6789, 124, 765, 1234, 986, 435, 786, 378534, 4355, 2345, 546, 78, 3];

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBarWithSuggestions> {
  // mutable values - input string, list of suggested boat numbers, regex
  List<int> suggBoatNumbers = new List<int>();
  String s = "";
  RegExp pattern;

  // method to update list of suggestions based on user input
  void updateSuggestions(){
    suggBoatNumbers = [];
    // on bracket inputs this crashes because RegExp can't parse- wrapped in TRY
    try{
      // set the relevant RegExp based on the type of search we want to do
      switch (getSearchType()) {
        case "start": {
          pattern = RegExp('^' + s);
        } break;
        case "middle": {
          pattern = RegExp(s);
        } break;
        case "end": {
          pattern = RegExp(s + r'$');
        } break;}

      // for each boat, if there's a match add it to the list of suggestions
      for(int boat in widget.competitors) {
        if (pattern.hasMatch(boat.toString())){
          suggBoatNumbers.add(boat);
        }
      }
    } on Exception catch(e) { debugPrint(e.toString()); } // output any errors
  }

  // method to create the list of suggestion widgets from the input and list
  List<Widget> drawSuggestions(List<int> sugg) {
    List<Widget> suggCards = [];
    // only do this if there ARE some suggestions, to save time for empty input
    if (sugg != null) {
      sugg.sort();
      for (int i in sugg) {
        suggCards.add(
            SizedBox(
              child: Card(
                child: ListTile(
                  leading: Text("Laps: 1"),
                  title: Text(i.toString()),
                  trailing: Icon(Icons.check),
                ),
                color: Colors.white70,
              ),
            )
        );}}
    return suggCards;
  }

  // create the input controller, overriding dispose and init to set it up
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  // set the behaviour for the initial state of the Widget
  @override
  void initState(){
    setSearchType("middle");
    inputController.addListener(() {
      setState(() { s = inputController.text; });
    });
    super.initState();
  }

  // method to draw and return the search box itself
  Widget drawSearchBox() {
    return new Container (
        padding: const EdgeInsets.only(
          top: 20,
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
                      style: new TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                    new TextFormField(
                      // link controller to this input box
                      autovalidate: true,
                      validator: (text) {
                        // if the input is non-empty and can't be parsed as an int, it's invalid
                        if ((int.tryParse(text) == null || int.tryParse(text) < 0) && text != "") {
                          debugPrint("invalid input detected");
                          return "Positive integers only";
                        }
                        else {
                          debugPrint("valid input detected");
                          return null;
                        }
                      },
                      controller: inputController,
                      autofocus: true,
                      // try to call user keyboard in NUMBER mode by default
                      keyboardType: TextInputType.number,
                    ),
                  ]
              ),
            )));
  }

  // list of button statuses as boolean values. (TRUE -> button is active)
  List<bool> buttonStatuses = [true, false, false];

  // method to draw and return the buttons at the top of the screen
  Widget drawButtons() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      // consists of ButtonBar which contains the three buttons
      child: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new RaisedButton(
              child: Text("CONTAINS"),
              // set colour based on current status for this button
              color: buttonStatuses[0] ? Colors.grey : null,
              onPressed: () => setState(() {
                buttonStatuses = [true, false, false];
                setSearchType("middle");
              })
          ),
          new RaisedButton(
              child: Text("X____"),
              color: buttonStatuses[1] ? Colors.grey : null,
              onPressed: () => setState(() {
                buttonStatuses = [false, true, false];
                setSearchType("start");
              })
          ),
          new RaisedButton(
              child: Text("____X"),
              color: buttonStatuses[2] ? Colors.grey : null,
              onPressed: () => setState(() {
                buttonStatuses = [false, false, true];
                setSearchType("end");
              })
          ),
        ],
      ),
    );
  }

  List<Widget> suggWidgets = new List<Widget>();
  // build method to create a search bar with suggestions
  @override
  build(BuildContext context) {
    updateSuggestions();
    suggWidgets = drawSuggestions(suggBoatNumbers);
    return new Column(
      children: <Widget> [
        Padding(padding: EdgeInsets.only(top: 30)),
        Text("Search Type:",
          style: new TextStyle(color: Colors.red, fontSize: 20.0),),
        drawButtons(),
        drawSearchBox(),
        Expanded(
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
        ),
      ],
    );
  }
}