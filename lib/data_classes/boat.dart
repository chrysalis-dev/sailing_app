class Boat {
  int boatID;
  String helmName;
  String crewName;
  int pY;
  String boatClass;

  Boat(
      this.boatID,
      this.helmName,
      this.crewName,
      this.pY,
      this.boatClass
  );

  String toString() {
    return "Boat with id ${this.boatID}, helmed by ${this.helmName}";
  }
}
