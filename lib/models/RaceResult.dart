import 'package:sailing_app/dbmodels/DbRaceResult.dart';

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

  factory RaceResult.fromDbObject(DbRaceResult race) {
    return RaceResult(race.id, race.rank, race.elapsedTime, race.laps,
        race.correctedTime, race.points, race.mention);
  }

  String toString() {
    return "\n" +
        " Boat with id ${this.boatID}\n" +
        " Finished on rank ${this.rank}\n" +
        " With ${this.points} points\n" +
        " It did ${this.laps}\n" +
        " In ${this.elapsedTime} minutes (converted to ${this.correctedTime})\n" +
        " Special mentions: ${this.specialMentions}\n";
  }

  static List<RaceResult> listFromDbObject(List<DbRaceResult> results) {
    List<RaceResult> raceResults = new List<RaceResult>();
    for (DbRaceResult result in results) {
      raceResults.add(RaceResult.fromDbObject(result));
    }
    return raceResults;
  }
}
