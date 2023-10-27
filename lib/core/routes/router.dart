import 'package:statszone/presentation/navigation/navigation.dart';
import 'package:statszone/presentation/pages/player_detailed_screen.dart';

import '../app_core.dart';

class AppNavigator {
  // NAVIGATE TO A PAGE WITHOUT REPLACING THE PREVIOUS PAGE.
  static void navigateToPage(
          {required String routeName, required BuildContext context}) =>
      Navigator.of(context).pushNamed(routeName);

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
            routeName: settings.name, view: PlayerDetailedScreen());
      case AppRoutes.navigation:
        return _getPageRoute(
            routeName: settings.name, view: const NavigationWidget());
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
