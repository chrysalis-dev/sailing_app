import 'package:sailing_app/dbmodels/DbBoat.dart';

class Boat {
  int boatID;
  String helmName;
  String crewName;
  int py;
  String boatClass;

  Boat(int id, String helmName, String crewName, int py, String boatClass) {
    this.boatID = id;
    this.boatClass = boatClass;
    this.helmName = helmName;
    this.crewName = crewName;
    this.py = py;
  }

  factory Boat.fromDbObject(DbBoat boat) {
    return Boat(
        boat.sailNo, boat.helmName, boat.crewName, boat.py, boat.className);
  }

  String toString() {
    return "\n" +
        " Boat with id ${this.boatID}\n" +
        " Of class ${this.boatClass}\n" +
        " Helmed by ${this.helmName}\n" +
        " From crew ${this.crewName}\n" +
        " PY = ${this.py}\n";
  }
}
