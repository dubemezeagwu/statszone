import 'package:statszone/domain/app_domain.dart';

final topGoalsFutureProvider = FutureProvider(((ref) async {
  final response = await ref.read(playerRepositoryProvider).getTopGoalScorers();
  if (response.status == true) return response.data;
}));

final topAssistsFutureProvider = FutureProvider(((ref) async {
  final response = await ref.read(playerRepositoryProvider).getTopAssists();
  if (response.status == true) return response.data;
}));

final topYellowCardsFutureProvider = FutureProvider(((ref) async {
  final response = await ref.read(playerRepositoryProvider).getTopYellowCards();
  if (response.status == true) return response.data;
}));

final topRedCardsFutureProvider = FutureProvider(((ref) async {
  final response = await ref.read(playerRepositoryProvider).getTopRedCards();
  if (response.status == true) return response.data;
}));
