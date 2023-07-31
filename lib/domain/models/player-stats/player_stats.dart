import 'package:statszone/domain/app_domain.dart';

class PlayerStats {
  final Team? team;
  final League? league;
  final Game? game;
  final Substitution? substitution;
  final Shot? shot;
  final Goal? goal;
  final Pass? pass;
  final Tackle? tackle;
  final Duel? duel;
  final Dribble? dribble;
  final Foul? foul;
  final Booking? card;
  final Penalty? penalty;

  PlayerStats({
    this.team,
    this.league,
    this.game,
    this.substitution,
    this.shot,
    this.goal,
    this.pass,
    this.tackle,
    this.duel,
    this.dribble,
    this.foul,
    this.card,
    this.penalty,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
      tackle: Tackle.fromJson(json["tackles"]),
      team: Team.fromJson(json["team"]),
      game: Game.fromJson(json["games"]),
      league: League.fromJson(json["league"]),
      substitution: Substitution.fromJson(json["substitutes"]),
      shot: Shot.fromJson(json["shots"]),
      goal: Goal.fromJson(json["goals"]),
      pass: Pass.fromJson(json["passes"]),
      dribble: Dribble.fromJson(json["dribbles"]),
      duel: Duel.fromJson(json["duels"]),
      foul: Foul.fromJson(json["fouls"]),
      card: Booking.fromJson(json["cards"]),
      penalty: Penalty.fromJson(json["penalty"])

    );
  }

  Map<String, dynamic> toJson () => {
    "tackles": tackle,
    "team": team,
    "games": game,
    "league": league,
    "substitutes": substitution,
    "shots": shot,
    "goals": goal,
    "passes": pass,
    "dribbles": dribble,
    "duels": duel,
    "fouls": foul,
    "cards": card,
    "penalty": penalty
  };
}
