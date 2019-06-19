import 'package:flutter/material.dart';

import 'Competition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sailing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sailhelp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Competition> _competitions = [];

  void _addCompetition() {
    setState(() {
      String competitionName = 'Event A';
      _competitions.add(
          new Competition(competitionName, DateTime.now(), DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCompetition,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: _competitions.length,
        itemBuilder: (context, index) {
          return _buildListItem(_competitions[index]);
        });
  }

  Widget _buildListItem(Competition competition) {
    return new Card(
      child: ListTile(
        leading: Icon(Icons.directions_boat, size: 56),
        title: Text(competition.name),
        subtitle: Text('Additional information'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
