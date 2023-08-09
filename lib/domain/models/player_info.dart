import 'package:equatable/equatable.dart';
import 'package:statszone/domain/models/player-stats/player_stats.dart';
import 'package:statszone/domain/models/player.dart';

class PlayerInfo extends Equatable{
  final Player? player;
  final PlayerStats? playerStats;

  const PlayerInfo({
    this.player,
    this.playerStats
  });

  factory PlayerInfo.fromJson (Map<String, dynamic> json){
    return PlayerInfo(
      player: Player.fromJson(json["player"]),
      playerStats : PlayerStats.fromJson(json["statistics"][0])
    );
  }

  Map<String, dynamic> toJson ()=> {
    "player": player,
    "statistics" : playerStats
  };
  
  @override
  List<Object?> get props => [player,playerStats];
}
