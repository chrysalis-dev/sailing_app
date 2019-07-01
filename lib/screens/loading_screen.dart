import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint("rotating...");
    return Center(
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.only(top: 5),),
            Text("Generating race results...",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
              ),),
          ],
        ),
      ),
    );
  }
}