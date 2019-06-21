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
        home: Scaffold(
          appBar: AppBar(
            title: Text("searching for boats..."),
          ),
          body: SearchBarWithSuggestions(),
            )
        );
  }
}

String _searchType = "";
String getSearchType() {return _searchType;}
void setSearchType(String s) {_searchType = s; debugPrint("input was: " + s);}

class SearchBarWithSuggestions extends StatefulWidget {
  //immutable constants: possible boat numbers, RegEx patterns
  final List<int> competitors = [12343, 6534, 8756, 6789, 124, 765, 1234, 986, 435, 786, 378534, 4355, 2345, 546, 78, 3];

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBarWithSuggestions> {
  // mutable values - input string and list of suggestions
  List<int> suggBoatNumbers = new List<int>();
  String s = "";

  // method to update list of suggestions based on user input
  void updateSuggestions(){
    suggBoatNumbers = [];
    RegExp pattern;
    debugPrint(getSearchType());
    try{
      switch (getSearchType()) {
        case "start": {
          debugPrint("start regex");
          pattern = RegExp('^' + s);
        } break;
        case "middle": {
          debugPrint("middle regex");
          pattern = RegExp(s);
        } break;
        case "end": {
          debugPrint("end regex");
          pattern = RegExp(s + r'$');
        } break;}

      for(int boat in widget.competitors) {
        if (pattern.hasMatch(boat.toString())){
          suggBoatNumbers.add(boat);
        }
      }
    } on Exception catch(e) { debugPrint(e.toString()); }


  }

  // method to create the list of suggestion widgets from the input and list
  List<Widget> drawSuggestions(List<int> sugg) {
    List<Widget> suggCards = [];
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

  @override
  void initState(){
    setSearchType("middle");
    inputController.addListener(() {
      setState(() { s = inputController.text; });
    });
    super.initState();
  }

  Widget drawSearchBox() {
    return new Container (
        padding: const EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30,),
        child: new Container(
            child: new Center(
              child: new Column(
                  children : [
                    new Text('Enter boat number:',
                      style: new TextStyle(color: Colors.red, fontSize: 20.0),),
                    new TextFormField(
                      controller: inputController,
                      autovalidate: true,
                      validator: (text) {
                        if (int.tryParse(text) == null && text != "") {
                          debugPrint("invalid input detected");
                          return "Integers only";
                        }
                        else
                          debugPrint("valid input detected");
                          return null;
                        },
                      autofocus: true,
                      keyboardType: TextInputType.number,
                    ),
                  ]
              ),
            )));
  }

  // list of button statuses as boolean values. TRUE -> button is active
  List<bool> buttonStatuses = [true, false, false];

  Widget drawButtons() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton(
                child: Text("CONTAINS"),
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
            padding: const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 20,),
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