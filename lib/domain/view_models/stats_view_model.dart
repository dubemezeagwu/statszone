import 'package:statszone/domain/app_domain.dart';

final statsViewModelProvider = ChangeNotifierProvider<StatsViewModel>(((ref) {
  return StatsViewModel();
}));

final topGoalsFutureProvider = FutureProvider(((ref) {
  return ref.read(statsViewModelProvider).getTopGoalScorers();
}));

final topAssistsFutureProvider = FutureProvider(((ref) {
  return ref.read(statsViewModelProvider).getTopAssists();
}));

final topYellowCardsFutureProvider = FutureProvider(((ref) {
  return ref.read(statsViewModelProvider).getTopYellowCards();
}));

final topRedCardsFutureProvider = FutureProvider(((ref) {
  return ref.read(statsViewModelProvider).getTopRedCards();
}));

class StatsViewModel extends ChangeNotifier {
  List<PlayerInfo> topGoalScorers = [];
  List<PlayerInfo> topAssists = [];
  List<PlayerInfo> topYellowCards = [];
  List<PlayerInfo> topRedCards = [];

  final Logger logger = Logger();
  String errorMessage = "";
  final PlayerServices _playerServices = locator<PlayerServices>();

  Future<List<PlayerInfo>> getTopGoalScorers() async {
    try {
      final response = await _playerServices.getTopGoalScorers();
      if (response.status == true) {
        logger.d("Players: ${response.data}");
        topGoalScorers = response.data ?? [];
        notifyListeners();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return topGoalScorers;
  }

  Future<List<PlayerInfo>> getTopAssists() async {
    try {
      final response = await _playerServices.getTopAssists();
      if (response.status == true) {
        logger.d("Players: ${response.data}");
        topAssists = response.data ?? [];
        notifyListeners();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return topAssists;
  }

  Future<List<PlayerInfo>> getTopYellowCards() async {
    try {
      final response = await _playerServices.getTopYellowCards();
      if (response.status == true) {
        logger.d("Players: ${response.data}");
        topYellowCards = response.data ?? [];
        notifyListeners();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return topYellowCards;
  }

  Future<List<PlayerInfo>> getTopRedCards() async {
    try {
      final response = await _playerServices.getTopRedCards();
      if (response.status == true) {
        logger.d("Players: ${response.data}");
        topRedCards = response.data ?? [];
        notifyListeners();
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    return topRedCards;
  }
}
