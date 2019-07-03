import 'package:flutter/material.dart';

class ProcessingAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircularProgressIndicator(backgroundColor: Colors.orange,),
        Padding(padding: EdgeInsets.only(right: 10),),
        Text("Calculating race results...")
      ],
    );
  }
}