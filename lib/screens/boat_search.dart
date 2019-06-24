import 'package:flutter/material.dart';
import 'package:sailing_app/data_classes/boat.dart';
import 'dart:math';
import 'package:sailing_app/data_classes/race_result.dart';
import 'package:sailing_app/data_classes/competitor.dart';
import 'package:sailing_app/widgets/suggestions_dropdown.dart';
import '../widgets/search_type_buttons.dart';
import '../widgets/search_bar.dart';

String searchType = ""; // current search mode (middle/start/end)
String inputString = ""; // string to hold and read input value from
List<bool> buttonStatuses = [true, false, false]; // button statuses (TRUE -> active)


// the main Widget in this view is stateful
class SearchBarWithSuggestions extends StatefulWidget {
  final List<Competitor> competitors = []; //immutable: list of competitors


  // setters and getters for input string, search type and button statuses:
  String getSearchType() {return searchType;}
  void setSearchType(String s) {searchType = s;}
  String getInputString() { return inputString; }
  void setInputString(String s) { inputString = s; }
  List<bool> getButtonStatuses() { return buttonStatuses; }
  void setButtonStatuses(List<bool> l) { buttonStatuses = l; }

  // constructor: takes number of competitors and creates that many random boats
  SearchBarWithSuggestions(int n) {
    var random = new Random();
    for(var i = 0; i < n; i++) {
      var n = random.nextInt(100000);
      competitors.add(Competitor(
          boat: Boat(n, "", "", 0, ""),
          result: RaceResult(n, 0, 0, 0, 0, 0, "")
      ));
    }
  }

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
    widget.setSearchType("middle");
    super.initState();
  }

  // build method to create a search bar with suggestions
  @override
  build(BuildContext context) {
    return new Column(
      children: <Widget> [
        SearchTypeButtons(widget, updateParent: refresh),
        SearchBar(widget, updateParent: refresh,),
        SuggestionsDropdown(widget, widget.competitors),
    ],
    );
  }
}