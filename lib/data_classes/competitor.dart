import 'package:sailing_app/data_classes/race_result.dart';
import 'package:sailing_app/data_classes/boat.dart';
import 'package:flutter/foundation.dart';

class Competitor implements Comparable<Competitor>{
  Boat boat;
  RaceResult result;
  int lapCount;
  DateTime lastLapTime;
  List<Duration> lapData = [null];

  Competitor({@required this.boat, @required this.result}) { lapCount = 0; }

  void registerLap(DateTime lap, DateTime start) {
    lastLapTime = lap;
    lapCount++;
    lapData.add(lap.difference(start));
  }

  String printLastLap() {
    return lapData[lapCount].toString().substring(0, 7);
  }
  
  @override
  int compareTo(Competitor other) {
    if (this.lapCount > other.lapCount) { return 1; }
    else if (this.lapCount < other.lapCount) { return -1; }
    else {
      if (other.boat.boatID == this.boat.boatID)
        return 0;
      else if (other.boat.boatID > this.boat.boatID)
        return -1;
      else
        return 1;
    }
  }
}