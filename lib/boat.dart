class Boat {
  int boatID;
  String helmName;
  String crewName;
  int pY;
  String boatClass;

  Boat(int id, String helmName, String crewName, int py, String boatClass) {
    this.boatID = id;
    this.helmName = boatClass;
    this.helmName = helmName;
    this.crewName = crewName;
    this.pY = py;
  }

  String toString() {
    return "Boat with id ${this.boatID}, helmed by ${this.helmName}";
  }
}
