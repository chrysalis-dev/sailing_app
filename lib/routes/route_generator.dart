import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/screens/competition_screen.dart';
import 'package:sailing_app/screens/home.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_expanded.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Arguments that are passed to the route on generation

    final args = settings.arguments;

    // Switch statement that redirects to routes depending on the name passed
    switch (settings.name) {

      // Navigate to the main page
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => MyHomePage(
                title: 'Smooth Sailing',
              ),
        );

      // Navigate to a screen of an existing competition
      case CompIt.routeName:
        if (args is Competition) {
          return MaterialPageRoute(
            builder: (context) => CompetitionScreen(
                  competition: args,
                ),
          );
        }
        return _errorRoute(); // Return error if no competition passed as an argument

      // Navigate to the the new competition creation dialog screen
      case CompDialog.routeName:
        return MaterialPageRoute(
          builder: (context) => CompDialog(),
        );

      // By default, it redirects to an error screen
      default:
        return _errorRoute();
    }
  }

  // Error screen
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
