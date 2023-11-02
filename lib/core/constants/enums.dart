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
