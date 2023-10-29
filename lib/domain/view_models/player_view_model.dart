import 'package:statszone/domain/app_domain.dart';

final playerViewModelProvider =
    StateNotifierProvider<PlayerViewModel, List<PlayerInfo>>(
  (ref) {
    return PlayerViewModel([]);
  },
);

class PlayerViewModel extends StateNotifier<List<PlayerInfo>> {
  PlayerViewModel(List<PlayerInfo> state) : super(state);

  final Logger logger = Logger();
  String errorMessage = "";
}

final searchAllPlayersProvider =
    FutureProviderFamily((ref, String playerName) async {
  final response =
      await ref.watch(playerRepositoryProvider).searchForPlayer(playerName);
  if (response.status == true) return response.data;
});

final selectedPlayerProvider = StateProvider<PlayerInfo?>((ref) => null);
