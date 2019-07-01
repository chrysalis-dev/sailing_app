class DbBoat {
  String className;
  String crewName;
  String helmName;
  int py;
  int sailNo;

  DbBoat({this.className, this.crewName, this.helmName, this.py, this.sailNo});

  static List<DbBoat> listFromJson(List<dynamic> parsedJson) {
    int count = (parsedJson != null ? parsedJson.length : 0);
    
    List<DbBoat> boats = new List<DbBoat>();
    for (var i = 0; i < count; i++) {
      boats.add(DbBoat.fromJson(parsedJson[i]));
    }
    return boats;
  }

  factory DbBoat.fromJson(Map<String, dynamic> parsedJson) {
    return DbBoat(
        className: parsedJson['Class'],
        crewName: parsedJson['CrewName'],
        helmName: parsedJson['HelmName'],
        py: parsedJson['PY'],
        sailNo: parsedJson['SailNo']);
  }
}
