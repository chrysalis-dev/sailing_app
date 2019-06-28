import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';

class Competitions {
  static List<Competition> competitions = [];
  static bool dark = true;

  void addCompetition(
      {@required String name,
      @required DateTime start,
      @required DateTime end}) {
    competitions.add(new Competition(name, start, end));
  }

  void removeCompetition(Competition c) {
    competitions.remove(c);
  }

  void removeRace(Competition c) {
    c.races.removeLast();
  }
}
