import 'package:statszone/domain/app_domain.dart';

class TeamInfo {
  final Team team;
  final Venue venue;

  TeamInfo({required this.team, required this.venue});

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    return TeamInfo(
        team: Team.fromJson(json["team"]),
        venue: Venue.fromJson(json["venue"])
        );
  }

  Map<String, dynamic> toJson() => {
    "team": team.toJson(),
    "venue": venue.toJson()
  };
}
