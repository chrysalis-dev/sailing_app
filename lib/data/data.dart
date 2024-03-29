import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';

class Competitions {
  static List<Competition> competitions = [];
  static bool dark = true;

  void addCompetition({
    @required String name,
    @required DateTime start,
    @required DateTime end,
  }) {
    competitions.add(
      new Competition(
        name: name,
        startDate: start,
        endDate: end,
      ),
    );
  }

  void removeCompetition(Competition c) {
    competitions.remove(c);
  }
}
