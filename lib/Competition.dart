import 'Race.dart';

class Competition {
  String name;
  DateTime startDate;
  DateTime endDate;
  List<Race> races = new List<Race>();

  Competition(String name, DateTime start, DateTime end) {
    this.name = name;
    this.startDate = start;
    this.endDate = end;
  }



  String toString() {
    return "Competion ${this.name} starts on ${this.startDate} and ends on ${this.endDate}. It has ${this.races.length} races";
  }
}
