import 'package:statszone/domain/app_domain.dart';
import 'package:statszone/domain/models/mini_player.dart';

class SquadInfo extends Equatable {
  final Team? team;
  final List<MiniPlayer>? players;

  const SquadInfo({this.team, this.players});

  factory SquadInfo.fromJson(Map<String, dynamic> json) {
    var list = json['players'] as List;
    List<MiniPlayer> playersList = list.map((i) => MiniPlayer.fromJson(i)).toList();
    return SquadInfo(
        team: Team.fromJson(json["team"]),
        players: playersList);
  }

  Map<String, dynamic> toJson () {
    List<Map<String, dynamic>>? players = this.players != null ? this.players!.map((i) => i.toJson()).toList() : null;
    
    return {
      "team" : team?.toJson(),
      "player": players,
    };
    
  }

  @override
  List<Object?> get props => [];
}
