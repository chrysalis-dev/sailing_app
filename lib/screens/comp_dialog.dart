import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/widgets/albert_temp_folder/dti.dart';

class CompDialog extends StatefulWidget {
  static const routeName = '/compdialog';
  @override
  _CompDialogState createState() => _CompDialogState();
}

class _CompDialogState extends State<CompDialog> {
  DateTime _fromDateTime = DateTime.now();
  DateTime _toDateTime = DateTime.now();
  bool _saveNeeded = false;
  bool _hasName = false;
  String _competitionName;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_hasName ? _competitionName : 'New Competition'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              if (_hasName) {
                Navigator.pop(
                  context,
                  new Competition(
                    _competitionName,
                    _fromDateTime,
                    _toDateTime,
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: Form(
          child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.bottomLeft,
            child: TextField(
              decoration: const InputDecoration(
                  labelText: 'Competition name', filled: true),
              style: theme.textTheme.headline,
              onChanged: (String value) {
                setState(() {
                  _hasName = value.isNotEmpty;
                  if (_hasName) {
                    _competitionName = value;
                  }
                });
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('From', style: theme.textTheme.caption),
              DateTimeItem(
                dateTime: _fromDateTime,
                onChanged: (DateTime value) {
                  setState(() {
                    _fromDateTime = value;
                    _saveNeeded = true;
                  });
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('To', style: theme.textTheme.caption),
              DateTimeItem(
                dateTime: _toDateTime,
                onChanged: (DateTime value) {
                  setState(() {
                    _toDateTime = value;
                    _saveNeeded = true;
                  });
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
