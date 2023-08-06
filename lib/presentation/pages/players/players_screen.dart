import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/presentation/app_presentation.dart';
import 'package:statszone/presentation/widgets/customized_loader.dart';
import 'package:statszone/presentation/widgets/text-fields/app_textfield.dart';

final playerSearchFutureProvider =
    FutureProvider.family(((ref, String args) async {
  ref.read(playerViewModelProvider.notifier).searchForPlayer(args);
}));

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer(builder: ((context, ref, child) {
      final playerData = ref.watch(playerViewModelProvider);
      print("Data: ${playerData.toString()}");
      return Column(
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
                ref.read(playerSearchFutureProvider(val));
              }
            },
          ).paddingAll(20.0),
          const SizedBox(
            height: 6,
          ),
          (playerData.isNotEmpty)
              ? Expanded(
                  child: ListView.builder(
                      itemCount: playerData.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PlayerSearchWidget(
                          playerImage: playerData[index].player?.image,
                          name: playerData[index].player!.name!,
                          teamLogo: playerData[index].playerStats!.team?.logo,
                          teamName: playerData[index].playerStats!.team?.name,
                          position:
                              playerData[index].playerStats!.game?.position,
                        );
                      }),
                )
              : const Expanded(
                child: Center(
                  child: CustomizedLoader()
                  ))
        ],
      );
    })));
  }
}
