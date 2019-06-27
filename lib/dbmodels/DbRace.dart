import 'DbRaceResult.dart';

class DbRace {
  bool cancelled;
  String id;
  DateTime raceDate;
  List<DbRaceResult> results;

  DbRace({this.cancelled, this.id, this.raceDate, this.results});

  static List<DbRace> listFromJson(List<dynamic> parsedJson) {
    int count = (parsedJson != null ? parsedJson.length : 0);
    List<DbRace> races = new List<DbRace>();
    for (var i = 0; i < count; i++) {
      races.add(DbRace.fromJson(parsedJson[i]));
    }
    return races;
  }

  factory DbRace.fromJson(Map<String, dynamic> parsedJson) {
    return DbRace(
      cancelled: (parsedJson["cancelled"] == 1),
      raceDate: DateTime.parse(parsedJson["raceDate"]),
      id: (parsedJson["id"]),
      results: DbRaceResult.listFromJson(parsedJson["results"])
    );
  }
}
