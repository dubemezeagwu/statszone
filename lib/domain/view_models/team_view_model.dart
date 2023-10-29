import 'package:statszone/domain/app_domain.dart';

final teamViewModelProvider = Provider((ref) => TeamViewModel(ref.watch(teamRepositoryProvider)));

final teamsFutureProvider = FutureProvider((ref) async =>
    ref.watch(teamViewModelProvider).getAllTeams());

class TeamViewModel {
  final TeamServices _teamServices;
  List<TeamInfo> allTeams = [];
  String errorMessage = "";
  final logger = Logger();

  TeamViewModel(this._teamServices);

  Future <List<TeamInfo>> getAllTeams() async {
    try {
      final response = await _teamServices.getTeamsFromLeague();
      if (response.status == true) {
        allTeams = response.data ?? [];
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return allTeams;
  }
}
