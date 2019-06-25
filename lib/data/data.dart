import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';

class Competitions {
  static List<Competition> competitions = [];

  void addCompetition(
      {@required String name,
      @required DateTime start,
      @required DateTime end}) {
    competitions.add(new Competition(name, start, end));
  }

  void removeCompetition(Competition c) {
    competitions.remove(c);
  }
}
