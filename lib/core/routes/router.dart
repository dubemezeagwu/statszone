import 'package:go_router/go_router.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/navigation/navigation.dart';
import 'package:statszone/presentation/pages/favourites/favourites_info_screen.dart';
import 'package:statszone/presentation/pages/player_detailed_screen.dart';
import 'package:statszone/presentation/pages/stats/stats_detailed_screen.dart';
import 'package:statszone/presentation/pages/teams/squad_info_screen.dart';
import 'package:statszone/presentation/pages/teams/team_info_screen.dart';

class AppNavigator {
  AppNavigator._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorKeyTeams =
      GlobalKey<NavigatorState>(debugLabel: "teams");
  static final _sectionNavigatorKeyPlayers =
      GlobalKey<NavigatorState>(debugLabel: "players");
  static final _sectionNavigatorKeyStats =
      GlobalKey<NavigatorState>(debugLabel: "stats");
  static final _sectionNavigatorKeyFavourites =
      GlobalKey<NavigatorState>(debugLabel: "favourites");

  // Go Router Configuration
  static final GoRouter router = GoRouter(
      initialLocation: AppRoutes.teams,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state, navigationShell) {
              return getPage(
                  child: NavigationWidget(navigationShell: navigationShell),
                  state: state);
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                  navigatorKey: _sectionNavigatorKeyTeams,
                  routes: [
                    GoRoute(
                      path: AppRoutes.teams,
                      name: "teams",
                      builder: (context, state) {
                        return TeamsScreen(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _sectionNavigatorKeyPlayers,
                  routes: [
                    GoRoute(
                      path: AppRoutes.players,
                      name: "players",
                      builder: (context, state) {
                        return PlayersScreen(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _sectionNavigatorKeyStats,
                  routes: [
                    GoRoute(
                      path: AppRoutes.stats,
                      name: "stats",
                      builder: (context, state) {
                        return StatsScreen(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _sectionNavigatorKeyFavourites,
                  routes: [
                    GoRoute(
                        path: AppRoutes.favourites,
                        name: "favourites",
                        builder: (context, state) {
                          return FavouritesScreen(
                            key: state.pageKey,
                          );
                        },
                      )
                  ]),
            ]),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoutes.squadInfo,
          name: "squadInfo",
          builder: (context, state) {
            return SquadInfoScreen(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoutes.teamInfo,
          name: "teamInfo",
          builder: (context, state) {
            return TeamInfoScreen(key: state.pageKey);
          },
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoutes.playerDetails,
          name: "playerDetails",
          builder: (context, state) {
            return PlayerDetailedScreen(key: state.pageKey);
          },
        ),
        GoRoute(
          path: AppRoutes.statsDetails,
          name: "statsDetails",
          builder: (context, state) {
            final type = state.pathParameters["type"];
            return StatsDetailedScreen(
              AggregateType.fromTitle(type!),
              key: state.pageKey,
              );
          },
        )
      ]);
}

PageRoute _getPageRoute({String? routeName, Widget? view, Object? args}) =>
    MaterialPageRoute(
        settings: RouteSettings(name: routeName, arguments: args),
        builder: (_) => view!);

Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}
