import 'package:statszone/domain/models/player-stats/player_stats.dart';
import 'package:statszone/domain/models/player.dart';

class PlayerInfo {
  final Player? player;
  final PlayerStats? playerStats;

  PlayerInfo({
    this.player,
    this.playerStats
  });

  factory PlayerInfo.fromJson (Map<String, dynamic> json){
    return PlayerInfo(
      player: json["player"] as Player?,
      playerStats : json["statistics"] as PlayerStats?
    );
  }

  Map<String, dynamic> toJson ()=> {
    "player": player,
    "statistics" : playerStats
  };
}
