class DbStanding {
  int id;
  int nett;
  int rank;
  int total;

  DbStanding({this.id, this.rank, this.nett, this.total});

  static List<DbStanding> listFromJson(List<dynamic> parsedJson) {
    int count = parsedJson.length;
    List<DbStanding> standings = new List<DbStanding>();
    for (var i = 0; i < count; i++) {
      standings.add(DbStanding.fromJson(parsedJson[i]));
    }
    return standings;
  }

  factory DbStanding.fromJson(Map<String, dynamic> parsedJson) {
    return DbStanding(
        id: parsedJson['id'],
        nett: parsedJson['nett'],
        rank: parsedJson['rank'],
        total: parsedJson['total']);
  }
}
