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
  bool done = false;

  Competitor({@required this.boat, @required this.results}) {
    results.laps = 0;
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
