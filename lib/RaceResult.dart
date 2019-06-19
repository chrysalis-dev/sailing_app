class RaceResult {
  int boatID;
  int rank;
  int elapsedTime;
  int laps;
  int correctedTime;
  int points;
  String specialMentions;

  RaceResult(int id, int rank, int elapsed, int laps, int corrected, int points,
      String mentions) {
    this.boatID = id;
    this.rank = rank;
    this.elapsedTime = elapsed;
    this.laps = laps;
    this.correctedTime = corrected;
    this.points = points;
    this.specialMentions = mentions;
  }

  String toString() {
    return "The boat with id ${this.boatID} finished on rank ${this.rank} with ${this.points} points";
  }
}
