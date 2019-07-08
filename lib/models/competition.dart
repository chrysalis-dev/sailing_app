import '../dbmodels/DbCompetition.dart';

import 'race.dart';

class Competition {
  String name;
  DateTime startDate;
  DateTime endDate;
  List<Race> races = new List<Race>();

  Competition({this.name, this.startDate, this.endDate});

  factory Competition.fromDbObject(DbCompetition competition) {
    return Competition(
      name: competition.name,
      startDate: competition.startDate,
      endDate: competition.endDate,
    );
  }

  String toString() {
    return "\n" +
        " Competion ${this.name}\n" +
        " Starts on ${this.startDate}\n" +
        " Ends on ${this.endDate}\n" +
        " It has ${this.races.length} races\n";
  }
}
