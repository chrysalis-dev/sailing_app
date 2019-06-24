import 'package:sailing_app/data_classes/race.dart';

class Competition {
  String name;
  DateTime startDate;
  DateTime endDate;
  List<Race> races = new List<Race>();

  Competition(
      this.name,
      this.startDate,
      this.endDate
  );



  String toString() {
    return "Competion ${this.name} starts on ${this.startDate} and ends on ${this.endDate}. It has ${this.races.length} races";
  }
}
