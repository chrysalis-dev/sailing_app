import 'package:flutter/material.dart';
import 'package:sailing_app/screens/help_page.dart';
import '../models/competitor.dart';
import 'package:sailing_app/widgets/race_search/suggestions_dropdown.dart';
import '../widgets/race_search/search_type_buttons.dart';
import '../widgets/race_search/search_bar.dart';
import '../widgets/albert_temp_folder/processing_alert.dart';

// string determining the type of search we use. has setter + getter
String typeOfSearch; // current search mode (contains/start/end)

// string holding the user's typed input. has setter + getter
String userInput; // string to hold and read input value from

// boolean telling us whether we're on the last lap yet. has setter + getter
bool isFinalLap;

// the main Widget in this view is stateful
class SearchPage extends StatefulWidget {
  static const routeName = 'screen3';
  final List<Competitor> competitors; //immutable: list of competitors
  final DateTime startTime;

  // setters and getters for variables
  String get searchType => typeOfSearch;
  set searchType(String s) => typeOfSearch = s;

  String get inputString => userInput;
  set inputString(String s) => userInput = s;

  bool get finalLap => isFinalLap;
  set finalLap(bool b) => isFinalLap = b;

  // constructor: takes screen arguments: start time and competitors
  SearchPage(this.competitors) : startTime = DateTime.now();

  _SearchState createState() => _SearchState();
}

// state class for SearchPage
class _SearchState extends State<SearchPage> {
  // method which children can call to force setState in the parent
  void refresh() {
    setState(() {});
  }

  // initState() sets default search type to middle
  @override
  void initState() {
    userInput = "";
    typeOfSearch = "contains";
    isFinalLap = false;
    super.initState();
  }

  // build method to create a search bar with suggestions
  @override
  build(BuildContext context) {
    return new Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smooth Sailing"),
          actions: <Widget>[
            RawMaterialButton(
              elevation: 1,
              child: Text(
                "HELP",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(HelpPage.routeName);
              }, // onPressed
            ),
            Container(
              height: 50,
              width: 50,
              child: RawMaterialButton(
                shape: CircleBorder(),
                elevation: 1,
                child: Icon(Icons.done_all),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: ProcessingAlert(),
                        ),
                  );
                }, // onPressedwidget.
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            SearchTypeButtons(widget, updateParent: refresh),
            SearchBar(
              widget,
              updateParent: refresh,
            ),
            SuggestionsDropdown(widget, widget.competitors, widget.startTime),
          ],
        ),
      ),
    );
  }
}
