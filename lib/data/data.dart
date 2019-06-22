import 'package:sailing_app/models/competition.dart';

class Competitions {
  static List<Competition> competitions = [];

  void addCompetition({String name, DateTime start, DateTime end}) {
    competitions.add(new Competition(name, start, end));
  }
}
