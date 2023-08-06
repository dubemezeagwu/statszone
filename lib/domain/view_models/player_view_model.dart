import 'package:logger/logger.dart';
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
  final PlayerServices _playerServices = locator<PlayerServices>();

  Future<List<PlayerInfo>> searchForPlayer(String playerName) async {
    try {
      final response = await _playerServices.searchForPlayer(playerName);
      if (response.status == true) {
        logger.d("Players: ${response.data}");
        state = response.data ?? [];
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return state;
  }
}
