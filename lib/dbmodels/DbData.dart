class DbData
{
  List<dynamic> competitions;

  DbData({this.competitions});

  factory DbData.fromJson(List<dynamic> parsedJson) {
    return DbData(competitions: parsedJson);
  }
}