import 'RaceResult.dart';

class Race {
  int raceID;
  DateTime raceDate;
  List<RaceResult> results = new List<RaceResult>();

  Race(int id, DateTime date) {
    this.raceID = id;
    this.raceDate = date;
  }

  String toString() {
    return "This is a Race with id:${this.raceID}, starting on ${this.raceDate.toString()}";
  }
}
