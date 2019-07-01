import 'DbBoat.dart';
import 'DbRace.dart';
import 'DbStanding.dart';

class DbCompetition {
  String name;
  DateTime startDate;
  DateTime endDate;
  List<DbBoat> boats;
  List<DbRace> races;
  List<DbStanding> standings;

  DbCompetition(
      {this.name,
      this.startDate,
      this.endDate,
      this.boats,
      this.races,
      this.standings});

  factory DbCompetition.fromJson(Map<String, dynamic> parsedJson) {
    String competitionName = parsedJson.keys.first;
    Map<String, dynamic> jsonObject = parsedJson[competitionName];
    return DbCompetition(
        name: competitionName,
        startDate: DateTime.parse(jsonObject['startDate']),
        endDate: DateTime.parse(jsonObject['endDate']),
        boats: DbBoat.listFromJson(jsonObject['boats']),
        races: DbRace.listFromJson(jsonObject['races']),
        standings: DbStanding.listFromJson(jsonObject['standings']));
  }
}
