import 'package:statszone/domain/models/player_info.dart';
import 'package:statszone/domain/view_models/stats_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topGoals = ref.watch(topGoalsFutureProvider);
    final topAssists = ref.watch(topAssistsFutureProvider);
    final topYellowCards = ref.watch(topYellowCardsFutureProvider);
    final topRedCards = ref.watch(topRedCardsFutureProvider);
    return SafeArea(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),
        child: Column(children: [
          Wrap(spacing: 55, children: [
            GestureDetector(
              onTap: () {
                AppNavigator.navigateToPage(
                    routeName: AppRoutes.playerDetails, context: context);
              },
              child: StatsPreviewWidget(
                  image: topGoals.value![0].player?.image,
                  statsTitle: "Goals",
                  statsNumber:
                      topGoals.value![0].playerStats?.goal?.total.toString()),
            ),
            StatsPreviewWidget(
                image: topAssists.value![0].player?.image,
                statsTitle: "Assists",
                statsNumber:
                    topAssists.value![0].playerStats?.goal?.assists.toString()),
            StatsPreviewWidget(
                image: topYellowCards.value![0].player?.image,
                statsTitle: "Yellow Cards",
                statsNumber: topYellowCards.value![0].playerStats?.card?.yellow
                    .toString()),
            StatsPreviewWidget(
                image: topRedCards.value![0].player?.image,
                statsTitle: "Red Cards",
                statsNumber:
                    topRedCards.value![0].playerStats?.card?.red.toString())
          ])
        ]),
      ),
    ));
  }
}

class StatsData {
  final List<PlayerInfo> data;
  final String title;

  StatsData(this.data, this.title);
}
