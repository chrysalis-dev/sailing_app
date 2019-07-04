import 'package:flutter/material.dart';
import '../../screens/boat_search.dart';

// SearchBar stateful class
class SearchBar extends StatefulWidget {
  // immutable: parent widget and callback function
  final SearchBarWithSuggestions parent;
  final Function updateParent;

  // constructor stores values for parent and updateParent
  SearchBar(this.parent, {@required this.updateParent});

  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // mutable: input controller for listening and reacting to input
  TextEditingController inputController = TextEditingController();

  // overridden dispose method disposes of controller when done
  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  // overridden initState sets up listener for controller and its behaviour
  @override
  void initState() {
    inputController.addListener(() {
      widget.parent.inputString = inputController.text;
      widget.updateParent();
    });
    super.initState();
  }

  // method for building the widget itself in GUI
  @override
  Widget build(BuildContext context) {
    return Container(
        // all wrapped in a container for size control ability
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 0,
          left: 30,
          right: 30,
        ),
        child: new Container(
            child: new Center(
          // Column consists of "search type" title and the bar itself
          child: new Column(children: [
            new Text(
              'Enter boat number:',
              style: new TextStyle(color: Colors.blue, fontSize: 20.0),
            ),
            new TextFormField(
              // link controller to this input box
              autovalidate: true,
              validator: (text) {
                // if the input is non-empty and can't be parsed as an int, it's invalid
                if ((int.tryParse(text) == null || int.tryParse(text) < 0) &&
                    text != "") {
                  return "Positive integers only";
                } else {
                  return null;
                }
              },
              controller: inputController,
              autofocus: true,
              // try to call user keyboard in NUMBER mode by default
              keyboardType: TextInputType.number,
            ),
          ]),
        )));
  }
}
