class RaceResult {
  int boatID;
  int rank;
  int elapsedTime;
  int laps;
  int correctedTime;
  int points;
  String specialMentions;

  RaceResult(
      this.boatID,
      this.rank,
      this.elapsedTime,
      this.laps,
      this.correctedTime,
      this.points,
      this.specialMentions
  );

  String toString() {
    return "The boat with id ${this.boatID} finished on rank ${this.rank} with ${this.points} points";
  }
}
