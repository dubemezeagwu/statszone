import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/models/squad_info.dart';

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

final getSquadProvider = FutureProviderFamily((ref, String teamId) async {
  final response = await ref
      .watch(playerRepositoryProvider)
      .getSquadFromTeam(teamId: teamId);
  if (response.status == true) return response.data;
});

final selectedPlayerProvider = StateProvider<PlayerInfo?>((ref) => null);

final selectedSquadProvider = StateProvider<SquadInfo?>((ref) => null);

