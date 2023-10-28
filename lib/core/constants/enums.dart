enum AppState {Idle, Busy}

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