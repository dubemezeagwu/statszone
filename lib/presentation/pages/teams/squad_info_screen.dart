import 'package:cached_network_image/cached_network_image.dart';
import 'package:statszone/core/app_core.dart';
import 'package:statszone/domain/models/mini_player.dart';
import 'package:statszone/domain/view_models/player_view_model.dart';
import 'package:statszone/presentation/widgets/app-bars/main_appbar.dart';
import 'package:statszone/presentation/widgets/players/player_squad_widget.dart';

class SquadInfoScreen extends ConsumerWidget {
  const SquadInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final squadData = ref.watch(selectedSquadProvider);

    Map<String, List<MiniPlayer>> playersByPosition = {};
    if (squadData!.players != null) {
      for (var player in squadData.players!) {
        final position = player.position ?? "Footballer";
        if (playersByPosition[position] == null) {
          playersByPosition[position] = [];
        }
        playersByPosition[position]!.add(player);
      }
    }
    final ScrollController _controller = ScrollController();
    return Scaffold(
      appBar: MainAppBar(
        title: "Squad",
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  squadData!.team?.name ?? "",
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 6,
                ),
                CachedNetworkImage(
                  imageUrl: squadData.team?.logo ?? "",
                  height: 80,
                  width: 80,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            ListView.builder(
                itemCount: playersByPosition.keys.length,
                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: ((context, positionIndex) {
                  final position =
                      playersByPosition.keys.elementAt(positionIndex);
                  final players = playersByPosition[position];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${position}s",
                          style: context.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        itemCount: players?.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, playerIndex) {
                          final player = players?[playerIndex];
                          return PlayerSquadWidget(
                            name: player?.name ?? "",
                            playerImage: player?.photo ?? "",
                            playerNumber: player?.number.toString() ?? "00",
                            position: player?.position ?? "Footballer",
                          );
                        }),
                      ),
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
