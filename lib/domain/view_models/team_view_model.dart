import 'package:logger/logger.dart';
import 'package:statszone/domain/app_domain.dart';

final teamViewModelProvider = Provider((ref) => TeamViewModel());

class TeamViewModel {
  final TeamServices _teamServices = locator<TeamServices>();
  List<TeamInfo> allTeams = [];
  String errorMessage = "";
  final logger = Logger();

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
