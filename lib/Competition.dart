import 'Race.dart';
import 'package:intl/intl.dart';

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
    var dateFormatter = new DateFormat('MMMM dd yyyy');
    var timeFormatter = new DateFormat('H:m');
    return "Competion ${this.name} starts on ${dateFormatter.format(startDate)} at ${timeFormatter.format(startDate)} and ends on ${dateFormatter.format(endDate)} at ${timeFormatter.format(endDate)}. It has ${this.races.length} races";
  }
}
