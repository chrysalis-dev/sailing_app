import 'competitor.dart';

class SearchScreenArguments {
  List<Competitor> c; // list of competitors
  DateTime t; // start time of race
  int l; // number of laps

  SearchScreenArguments(this.t, this.c, this.l);
}