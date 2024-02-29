import 'package:go_router/go_router.dart';
import 'package:statszone/domain/view_models/player_view_model.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/customized_loader.dart';
import 'package:statszone/presentation/widgets/text-fields/app_textfield.dart';

class PlayersScreen extends ConsumerStatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends ConsumerState<PlayersScreen> {
  String playerName = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerData = ref.watch(searchAllPlayersProvider(playerName));
    return SafeArea(
        child: Column(
      children: [
        AppTextField(
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 25,
          ),
          suffixIcon: InkWell(
            onTap: () => _searchController.clear(),
            child: const Icon(Icons.close),
          ),
          isSearch: true,
          controller: _searchController,
          hintText: "Search Players",
          onChanged: (String val) {
            if (val.length >= 4) {
              setState(() {
                playerName = val;
              });
              ref.read(searchAllPlayersProvider(val));
            }
          },
        ).paddingAll(20.0),
        SizedBox(
          height: 6.h,
        ),
        Consumer(builder: ((context, ref, child) {
          return playerData.when(data: ((data) {
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("Search Players"),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final player = data[index];
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectedPlayerProvider.notifier).state =
                              player;
                          context.pushNamed("playerDetails");
                        },
                        child: PlayerSearchWidget(
                          playerImage: player.player?.image,
                          name: player.player!.name!,
                          teamLogo: player.playerStats!.team?.logo,
                          teamName: player.playerStats!.team?.name,
                          position: player.playerStats!.game?.position,
                        ),
                      );
                    }),
              );
            }
          }), error: ((error, stackTrace) {
            return const Center(child: Text("Error Occurred!"));
          }), loading: (() {
            return const Expanded(
              child: Center(child: CustomizedLoader()),
            );
          }));
        }))
      ],
    ));
  }
}
