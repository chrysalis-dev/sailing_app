import 'package:flutter/material.dart';
import '../models/competitor.dart';
import 'package:sailing_app/widgets/suggestions_dropdown.dart';
import '../widgets/search_type_buttons.dart';
import '../widgets/search_bar.dart';
import '../widgets/processing_alert.dart';

String searchType = ""; // current search mode (contains/start/end)
String inputString = ""; // string to hold and read input value from
bool finalLap = false;

// the main Widget in this view is stateful
class SearchBarWithSuggestions extends StatefulWidget {
  final List<Competitor> competitors; //immutable: list of competitors
  static final routeName = 'searchPage';

  // setters and getters for input string, search type and button statuses:
  String getSearchType() {return searchType;}
  void setSearchType(String s) {searchType = s;}
  String getInputString() { return inputString; }
  void setInputString(String s) { inputString = s; }
  bool checkFinalLap() { return finalLap; }
  void setFinalLap(bool l) { finalLap = l; }
    // constructor: takes screen arguments: start time and competitors
  SearchBarWithSuggestions(this.competitors);

  _SearchState createState() => _SearchState();
}

// state class for SearchBarWithSuggestions
class _SearchState extends State<SearchBarWithSuggestions> {

  // method which children can call to force setState in the parent
  void refresh() {
    setState( () {} );
  }

  // initState() sets default search type to middle
  @override
  void initState(){
    widget.setSearchType("contains");
    super.initState();
  }

  // build method to create a search bar with suggestions
  @override
build(BuildContext context) {
    return new  Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smooth Sailing"),
          actions: <Widget>[
            RawMaterialButton(
              elevation: 1,
              child: Text("HELP", style: TextStyle(color: Colors.white),),
              onPressed: () { Navigator.of(context).pushNamed('helpPage'); }, // onPressed
            ),
            Container(
              height: 50,
              width: 50,
              child: RawMaterialButton(
                shape: CircleBorder(),
                elevation: 1,
                child: Icon(Icons.done_all),
                onPressed: () { showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: ProcessingAlert(),
                  ),
                );}, // onPressed
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget> [
            SearchTypeButtons(widget, updateParent: refresh),
            SearchBar(widget, updateParent: refresh,),
            SuggestionsDropdown(widget, widget.competitors),
          ],
        ),
      ),
    );
  }
}