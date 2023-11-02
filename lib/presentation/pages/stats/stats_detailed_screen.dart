import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/view_models/stats_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/app-bars/main_appbar.dart';
import 'package:statszone/presentation/widgets/league_stats_widget.dart';

class StatsDetailedScreen extends ConsumerWidget {
  const StatsDetailedScreen(this.type, {super.key});
  final AggregateType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: type.title,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: aggregateBuilder(ref)),
    );
  }

  Widget aggregateBuilder(WidgetRef ref) {
    switch (type) {
      case AggregateType.goals:
        final topGoalScorers = ref.watch(topGoalsFutureProvider).value;
        return ReusableStatsWidget(data: topGoalScorers!, type: type);
      case AggregateType.assists:
        final topAssists = ref.watch(topAssistsFutureProvider).value;
        return ReusableStatsWidget(data: topAssists!, type: type);
      case AggregateType.redCards:
        final topRedCards = ref.watch(topRedCardsFutureProvider).value;
        return ReusableStatsWidget(data: topRedCards!, type: type);
      case AggregateType.yellowCards:
        final topYellowCards = ref.watch(topYellowCardsFutureProvider).value;
        return ReusableStatsWidget(data: topYellowCards!, type: type);
    }
  }
}

class ReusableStatsWidget extends StatelessWidget {
  const ReusableStatsWidget(
      {super.key, required this.data, required this.type});
  final List<PlayerInfo> data;
  final AggregateType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        highestStatsPlayer(),
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
          rows: data!.skip(1).toList().asMap().entries.map((entry) {
            int index = entry.key;
            PlayerInfo player = entry.value;
            switch (type) {
              case AggregateType.goals:
                return DataRowWidget(
                    number: index,
                    name: player.player?.name ?? "",
                    club: player.playerStats?.team?.logo ?? "",
                    value: player.playerStats?.goal?.total.toString() ?? "0");
              case AggregateType.assists:
                return DataRowWidget(
                    number: index,
                    name: player.player?.name ?? "",
                    club: player.playerStats?.team?.logo ?? "",
                    value: player.playerStats?.goal?.assists.toString() ?? "0");
              case AggregateType.redCards:
                return DataRowWidget(
                    number: index,
                    name: player.player?.name ?? "",
                    club: player.playerStats?.team?.logo ?? "",
                    value: player.playerStats?.card?.red.toString() ?? "0");
              case AggregateType.yellowCards:
                return DataRowWidget(
                    number: index,
                    name: player.player?.name ?? "",
                    club: player.playerStats?.team?.logo ?? "",
                    value: player.playerStats?.card?.yellow.toString() ?? "0");
            }
          }).toList(),
        ),
      ],
    );
  }

  Widget highestStatsPlayer (){
    switch (type) {
      case AggregateType.goals:
        return LeagueStatsTopWidget(
          name: data![0].player?.name ?? "",
          teamName: data[0].playerStats?.team?.name ?? "",
          teamLogo: data[0].playerStats?.team?.logo ?? "",
          playerPhoto: data[0].player?.image ?? "",
          value: data[0].playerStats?.goal?.total.toString() ?? "0",
        );
      case AggregateType.assists:
        return LeagueStatsTopWidget(
          name: data![0].player?.name ?? "",
          teamName: data[0].playerStats?.team?.name ?? "",
          teamLogo: data[0].playerStats?.team?.logo ?? "",
          playerPhoto: data[0].player?.image ?? "",
          value: data[0].playerStats?.goal?.assists.toString() ?? "0",
        );
      case AggregateType.redCards:
        return LeagueStatsTopWidget(
          name: data![0].player?.name ?? "",
          teamName: data[0].playerStats?.team?.name ?? "",
          teamLogo: data[0].playerStats?.team?.logo ?? "",
          playerPhoto: data[0].player?.image ?? "",
          value: data[0].playerStats?.card?.red.toString() ?? "0",
        );
      case AggregateType.yellowCards:
        return LeagueStatsTopWidget(
          name: data![0].player?.name ?? "",
          teamName: data[0].playerStats?.team?.name ?? "",
          teamLogo: data[0].playerStats?.team?.logo ?? "",
          playerPhoto: data[0].player?.image ?? "",
          value: data[0].playerStats?.card?.yellow.toString() ?? "0",
        );
    }
  }
  }

class DataRowWidget extends DataRow {
  DataRowWidget(
      {super.key,
      required this.number,
      required this.name,
      required this.club,
      required this.value})
      : super(
          cells: <DataCell>[
            DataCell(Text((number + 2)
                .toString())), // index + 1 because index starts from 0
            DataCell(Text(name ?? "")),
            DataCell(Row(
              children: [
                CachedNetworkImage(
                  imageUrl: club ?? "",
                  width: 25.w,
                  height: 25.h,
                ),
              ],
            )),
            DataCell(Text(value ?? "0")),
          ],
        );
  final int number;
  final String name;
  final String club;
  final String value;
}
