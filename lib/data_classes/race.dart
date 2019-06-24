import 'package:sailing_app/data_classes/race_result.dart';

class Race {
  int raceID;
  DateTime raceDate;
  List<RaceResult> results = new List<RaceResult>();

  Race(
      this.raceID,
      this.raceDate
  );

  String toString() {
    return "This is a Race with id:${this.raceID}, starting on ${this.raceDate.toString()}";
  }
}
