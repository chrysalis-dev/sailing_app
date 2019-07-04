/*
  NOTE: consider renaming to Racer instead, since there is a unique Competitor
  object for each race in a competition. As of writing the Race class isn't used
  so for now this is fine. Will probably need to change later on.
*/

import 'race_result.dart';
import 'boat.dart';
import 'package:flutter/foundation.dart';

class Competitor implements Comparable<Competitor> {
  Boat boat;
  RaceResult results;
  DateTime startTime;
  bool done = false;

  Competitor(
      {@required this.boat, @required this.results, @required this.startTime}) {
    results.laps = 0;
  }

  void registerLap(DateTime lapTime) {
    results.laps++;
    // elapsed time is in milliseconds
    results.elapsedTime =
        (lapTime.millisecondsSinceEpoch) - (startTime.millisecondsSinceEpoch);
  }

  get finished => done;
  set finished(bool b) {
    done = b;
  }

  @override
  int compareTo(Competitor other) {
    if (this.finished && !other.finished) {
      return 1;
    } else if (!this.finished && other.finished) {
      return -1;
    } else {
      if (this.results.laps > other.results.laps) {
        return 1;
      } else if (this.results.laps < other.results.laps) {
        return -1;
      } else {
        if (other.boat.boatID == this.boat.boatID)
          return 0;
        else if (other.boat.boatID > this.boat.boatID)
          return -1;
        else
          return 1;
      }
    }
  }
}
