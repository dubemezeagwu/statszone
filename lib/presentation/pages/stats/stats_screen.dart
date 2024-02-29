import 'package:go_router/go_router.dart';
import 'package:statszone/domain/models/player_info.dart';
import 'package:statszone/domain/view_models/stats_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/customized_loader.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topGoals = ref.watch(topGoalsFutureProvider).value;
    final topAssists = ref.watch(topAssistsFutureProvider).value;
    final topYellowCards = ref.watch(topYellowCardsFutureProvider).value;
    final topRedCards = ref.watch(topRedCardsFutureProvider).value;

    final groupedData = [
      StatsData(
          AggregateType.goals.title, 
          topGoals![0], 
          AggregateType.goals,
          topGoals[0].playerStats!.goal!.total.toString()),
      StatsData(
          AggregateType.assists.title,
          topAssists![0],
          AggregateType.assists,
          topAssists[0].playerStats!.goal!.assists.toString()),
      StatsData(
          AggregateType.yellowCards.title,
          topYellowCards![0],
          AggregateType.yellowCards,
          topYellowCards[0].playerStats!.card!.yellow.toString()),
      StatsData(
          AggregateType.redCards.title,
          topRedCards![0],
          AggregateType.redCards,
          topRedCards[0].playerStats!.card!.red.toString()),
    ];

    final resultProvider = FutureProvider<List<PlayerInfo>>(((ref) async {
      final topGoalsFuture = await ref.watch(topGoalsFutureProvider.future);
      final topAssistsFuture = await ref.watch(topAssistsFutureProvider.future);
      final topYellowCardsFuture =
          await ref.watch(topYellowCardsFutureProvider.future);
      final topRedCardsFuture =
          await ref.watch(topRedCardsFutureProvider.future);
      return topGoalsFuture! +
          topAssistsFuture! +
          topYellowCardsFuture! +
          topRedCardsFuture!;
    }));
    return SafeArea(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2022/2023 Stats",
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
              FutureBuilder<List<PlayerInfo>>(
                  future: ref.watch(resultProvider.future),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomizedLoader();
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          itemCount: snapshot.data?.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.goNamed("statsDetails",
                                    pathParameters: {
                                      "type": AggregateType.goals.title
                                    });
                              },
                              child: StatsPreviewWidget(
                                  image: groupedData[index]
                                          .playerInfo
                                          .player
                                          ?.image ??
                                      "",
                                  statsTitle: groupedData[index].title,
                                  statsNumber: groupedData[index].value),
                            );
                          },
                        ),
                      );
                    }
                  }),
            ],
          )),
    ));
  }
}

class StatsData {
  final String title;
  final AggregateType type;
  final PlayerInfo playerInfo;
  final String value;

  StatsData(this.title, this.playerInfo, this.type, this.value);
}
