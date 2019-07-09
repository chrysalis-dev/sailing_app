import 'package:flutter/material.dart';
import 'package:sailing_app/data/data.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/models/competitor.dart';
import 'package:sailing_app/screens/boat_search.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/screens/competition_screen.dart';
import 'package:sailing_app/screens/help_page.dart';
import 'package:sailing_app/screens/home.dart';
import 'package:sailing_app/screens/start_race_page.dart';

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
      case CompetitionScreen.routeName:
        if (args is Competition) {
          return MaterialPageRoute(
            builder: (context) => CompetitionScreen(
                  competition: args,
                ),
          );
        }
        return _errorRoute(
            'Competition Screen'); // Return error if no competition passed as an argument

      // Navigate to the the new competition creation dialog screen
      case CompDialog.routeName:
        return MaterialPageRoute(
          builder: (context) => CompDialog(),
        );

      case SearchPage.routeName:
        if (args is List<Competitor>) {
          return MaterialPageRoute(
            builder: (context) => SearchPage(settings.arguments),
          );
        }
        return _errorRoute(
            'Search Screen'); // Return error if no list of competitors passed as an argument

      case HelpPage.routeName:
        return MaterialPageRoute(
          builder: (context) => HelpPage(),
        );

      case StartRacePage.routeName:
        return MaterialPageRoute(
          builder: (context) => StartRacePage(
                thisRace: settings.arguments,
              ),
        );

      // By default, it redirects to an error screen
      default:
        return _errorRoute('Default error');
    }
  }

  // Error screen
  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Error',
          ),
        ),
        body: Text(message),
      );
    });
  }
}
