import 'package:statszone/domain/models/player_info.dart';
import 'package:statszone/domain/view_models/stats_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topGoals = ref.watch(topGoalsFutureProvider).value;
    final topAssists = ref.watch(topAssistsFutureProvider).value;
    final topYellowCards = ref.watch(topYellowCardsFutureProvider).value;
    final topRedCards = ref.watch(topRedCardsFutureProvider).value;
    return SafeArea(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),
        child: GridView.count(
  crossAxisCount: 2,
  childAspectRatio: 0.6,
  crossAxisSpacing: 20,
  children: <Widget>[
    GestureDetector(
      onTap: () {
        AppNavigator.navigateToPage(
            routeName: AppRoutes.statsDetails,
            context: context,
            arguments: AggregateType.goals);
      },
      child: StatsPreviewWidget(
          image: topGoals![0].player?.image ?? "",
          statsTitle: "Goals",
          statsNumber: topGoals[0].playerStats?.goal?.total.toString()),
    ),
    GestureDetector(
      onTap: () {
        AppNavigator.navigateToPage(
            routeName: AppRoutes.statsDetails,
            context: context,
            arguments: AggregateType.assists);
      },
      child: StatsPreviewWidget(
          image: topAssists![0].player?.image ?? "",
          statsTitle: "Assists",
          statsNumber: topAssists[0].playerStats?.goal?.assists.toString()),
    ),
    GestureDetector(
      onTap: () {
        AppNavigator.navigateToPage(
            routeName: AppRoutes.statsDetails,
            context: context,
            arguments: AggregateType.yellowCards);
      },
      child: StatsPreviewWidget(
          image: topYellowCards![0].player?.image ?? "",
          statsTitle: "Yellow Cards",
          statsNumber: topYellowCards[0].playerStats?.card?.yellow?.toString()),
    ),
    GestureDetector(
      onTap: () {
        AppNavigator.navigateToPage(
            routeName: AppRoutes.statsDetails,
            context: context,
            arguments: AggregateType.redCards);
      },
      child: StatsPreviewWidget(
          image: topRedCards![0].player?.image ?? "",
          statsTitle: "Red Cards",
          statsNumber: topRedCards[0].playerStats?.card?.red?.toString()),
    ),
  ],
)
      ),
    ));
  }
}
