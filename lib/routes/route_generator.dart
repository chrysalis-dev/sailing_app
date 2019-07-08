import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/screens/competition_screen.dart';
import 'package:sailing_app/screens/home.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_expanded.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: 'Smooth Sailing',
              ),
        );

      case CompIt.routeName:
        if (args is Competition) {
          return MaterialPageRoute(
              builder: (context) => CompetitionScreen(
                    competition: args,
                  ));
        }
        return _errorRoute();

      case CompDialog.routeName:
        return MaterialPageRoute(builder: (context) => CompDialog());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
          ),
        ),
      );
    });
  }
}
