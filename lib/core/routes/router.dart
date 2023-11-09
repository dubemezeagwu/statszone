import 'package:statszone/presentation/navigation/navigation.dart';
import 'package:statszone/presentation/pages/player_detailed_screen.dart';
import 'package:statszone/presentation/pages/stats/stats_detailed_screen.dart';
import 'package:statszone/presentation/pages/teams/squad_info_screen.dart';
import 'package:statszone/presentation/pages/teams/team_info_screen.dart';

import '../app_core.dart';

class AppNavigator {
  // NAVIGATE TO A PAGE WITHOUT REPLACING THE PREVIOUS PAGE.
  static void navigateToPage(
          {required String routeName,
          required BuildContext context,
          Object? arguments}) =>
      Navigator.of(context).pushNamed(routeName, arguments: arguments);

  // NAVIGATE TO A PAGE AND REPLACE THE PREVIOUS PAGE
  static void navigateToReplacementPage(
          {required String routeName, required BuildContext context}) =>
      Navigator.of(context).pushReplacementNamed(routeName);

  // PUSH NEW SCREEN AND REMOVE ALL SCREENS
  static void navigateToAndRemoveAllPreviousScreens(
          {required String routeName, required BuildContext context}) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routeName, (route) => false);

  // POP CURRENT SCREEN OF THE STACK
  static void navigateBack(
          {required String routeName, required BuildContext context}) =>
      Navigator.of(context).pop();

  // ROUTE GENERATOR
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.playerDetails:
        return _getPageRoute(
          routeName: settings.name,
          view: const PlayerDetailedScreen(),
        );
      case AppRoutes.navigation:
        return _getPageRoute(
            routeName: settings.name, view: const NavigationWidget());
      case AppRoutes.squadInfo:
        return _getPageRoute(
            routeName: settings.name, view: const SquadInfoScreen());
      case AppRoutes.teamInfo:
        return _getPageRoute(
            routeName: settings.name, view: const TeamInfoScreen());            
      case AppRoutes.statsDetails:
        return _getPageRoute(
            routeName: settings.name,
            view: StatsDetailedScreen(settings.arguments as AggregateType));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}

PageRoute _getPageRoute({String? routeName, Widget? view, Object? args}) =>
    MaterialPageRoute(
        settings: RouteSettings(name: routeName, arguments: args),
        builder: (_) => view!);
