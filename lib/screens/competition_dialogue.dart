import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompetitionDialogue extends StatefulWidget {
  final String title;

  CompetitionDialogue({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CompetitionDialogueState();
  }
}

class CompetitionDialogueState extends State<CompetitionDialogue> {
  final formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy"); // at' h:mma"
  String name;
  DateTime startDate;
  DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save_alt), onPressed: null)
        ],
      ),
      body: form(context),
    );
  }

  Widget form(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final dateFormat = DateFormat("EEEE, MMMM d, yyyy"); // at' h:mma"
    String name;
    DateTime startDate;
    DateTime endDate;

    return new Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Competition name',
                    hintText: 'eg. British Open',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (input) {
                    if (input.isNotEmpty) {
                      name = input;
                    }
                  },
                ),
                DateTimePickerFormField(
                  inputType: InputType.date,
                  format: dateFormat,
                  decoration: InputDecoration(labelText: 'Start date'),
                  onChanged: (t) => setState(() => startDate = t),
                ),
                DateTimePickerFormField(
                  inputType: InputType.date,
                  format: dateFormat,
                  decoration: InputDecoration(labelText: 'End Date'),
                  onChanged: (t) => setState(() => endDate = t),
                ),
              ],
            )));
  }
}
