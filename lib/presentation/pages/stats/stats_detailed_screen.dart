import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/view_models/stats_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/app-bars/main_appbar.dart';
import 'package:statszone/presentation/widgets/league_stats_widget.dart';

class StatsDetailedScreen extends ConsumerWidget {
  const StatsDetailedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topGoalScorers = ref.watch(topGoalsFutureProvider).value;
    return Scaffold(
      appBar: MainAppBar(
        title: "Players",
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LeagueStatsTopWidget(
              name: topGoalScorers?[0].player?.name ?? "",
              teamName: topGoalScorers?[0].playerStats?.team?.name ?? "",
              teamLogo: topGoalScorers?[0].playerStats?.team?.logo ?? "",
              value: topGoalScorers?[0].playerStats?.goal?.total.toString() ?? "0",
              playerPhoto: topGoalScorers?[0].player?.image ?? "",
            ),
            DataTable(
              // border: TableBorder.all(color: Colors.black),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('#'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Club'),
                ),
                DataColumn(
                  label: Text('Value'),
                ),
              ],
              rows: topGoalScorers!.skip(1).toList().asMap().entries.map((entry) {
                int index = entry.key;
                PlayerInfo player = entry.value;
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text((index + 2)
                        .toString())), // index + 1 because index starts from 0
                    DataCell(Text(player.player?.name ?? "")),
                    DataCell(Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: player.playerStats?.team?.logo ?? "",
                          width: 25.w,
                          height: 25.h,
                        ),
                      ],
                    )),
                    DataCell(Text(
                        player.playerStats?.goal?.total.toString() ?? "0")),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
