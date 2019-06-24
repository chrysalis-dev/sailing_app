import 'package:sailing_app/data_classes/race_result.dart';
import 'package:sailing_app/data_classes/boat.dart';
import 'package:flutter/foundation.dart';

class Competitor implements Comparable<Competitor>{
  Boat boat;
  RaceResult result;

  Competitor({@required this.boat, @required this.result});

  @override
  int compareTo(Competitor other) {
    if(other.boat.boatID == this.boat.boatID)
      return 0;
    else if(other.boat.boatID > this.boat.boatID)
      return -1;
    else
      return 1;
  }
}