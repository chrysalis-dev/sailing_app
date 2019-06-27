class DbRaceResult {
  int correctedTime;
  int elapsedTime;
  int id;
  int laps;
  int points;
  int rank;
  String mention;

  DbRaceResult(
      {this.correctedTime,
      this.elapsedTime,
      this.id,
      this.laps,
      this.mention,
      this.points,
      this.rank});

  static List<DbRaceResult> listFromJson(List<dynamic> parsedJson) {
    int count = (parsedJson != null ? parsedJson.length : 0);
    
    List<DbRaceResult> raceResults = new List<DbRaceResult>();
    for (var i = 0; i < count; i++) {
      raceResults.add(DbRaceResult.fromJson(parsedJson[i]));
    }
    return raceResults;
  }

  factory DbRaceResult.fromJson(Map<String, dynamic> parsedJson) {
    return DbRaceResult(
        correctedTime: parsedJson['correctedTime'],
        elapsedTime: parsedJson['elapsedTime'],
        id: parsedJson['id'],
        laps: parsedJson['laps'],
        points: parsedJson['points'],
        rank: parsedJson['rank'],
        mention: parsedJson['mention']);
  }
}
