import 'package:flutter/material.dart';
import 'package:sailing_app/models/competition.dart';
import 'package:sailing_app/models/competitor.dart';
import 'package:sailing_app/models/race.dart';
import 'package:sailing_app/screens/boat_search.dart';
import 'package:sailing_app/screens/comp_dialog.dart';
import 'package:sailing_app/screens/competition_screen.dart';
import 'package:sailing_app/screens/help_page.dart';
import 'package:sailing_app/screens/home.dart';
import 'package:sailing_app/screens/start_race_page.dart';
import 'package:sailing_app/widgets/albert_temp_folder/competition_expanded.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Arguments that are passed to the route on generation

    final args = settings.arguments;

    debugPrint(settings.name);

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
            "Competition Screen"); // Return error if no competition passed as an argument

      // Navigate to the the new competition creation dialog screen
      case CompDialog.routeName:
        return MaterialPageRoute(
          builder: (context) => CompDialog(),
        );

      case HelpPage.routeName:
        return MaterialPageRoute(
          builder: (context) => HelpPage(),
        );

      case StartRacePage.routeName:
        if (args is Race) {
          return MaterialPageRoute(
            builder: (context) => StartRacePage(thisRace: settings.arguments),
          );
        }
        return _errorRoute("Start Page");

      case SearchBarWithSuggestions.routeName:
        if (args is List<Competitor>) {
          return MaterialPageRoute(
            builder: (context) => SearchBarWithSuggestions(settings.arguments),
          );
        }
        return _errorRoute("Search Page");

      // By default, it redirects to an error screen
      default:
        return _errorRoute("default");
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
