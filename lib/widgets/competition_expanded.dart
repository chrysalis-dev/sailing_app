import 'package:flutter/material.dart';
import 'package:sailing_app/models/Competition.dart';

class CompIt extends StatelessWidget {
  final Competition competition;

  CompIt({Key key, @required this.competition}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(),
      ),
    );
  }
}
