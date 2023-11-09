import 'package:statszone/presentation/app_presentation.dart';

enum AppState { Idle, Busy }

enum PlayerAttributes {
  attacking("ATT"),
  technical("TEC"),
  tackling("TAC"),
  defense("DEF"),
  creativity("CRE");

  final String title;

  const PlayerAttributes(
    this.title,
  );
}

enum AggregateType {
  goals("Top Goals"),
  assists("Top Assists"),
  redCards("Top Red Cards"),
  yellowCards("Top Yellow Cards");

  final String title;

  const AggregateType(
    this.title,
  );
}

enum TeamOptions {
  teamInformation("Team Information", Icon(Icons.info)),
  form("Form", Icon(Icons.stacked_line_chart)),
  squad("Squad", Icon(Icons.stadium));

  final String title;
  final Icon icon;

  const TeamOptions(this.title, this.icon);
}

enum PlayerType {
  goalkeeper("Goalkeeper"),
  defender("Defender"),
  midfielder("Midfielder"),
  attacker("Attacker");

  final String title;

  const PlayerType(
    this.title,
  );
}
