class Penalty {
    final int? won;
    final int? committed;
    final int? scored;
    final int? missed;
    final int? saved;

    Penalty({
        this.won,
        this.committed,
        this.scored,
        this.missed,
        this.saved,
    });

    factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json["won"] as int?,
        committed: json["commited"] as int?,
        scored: json["scored"] as int?,
        missed: json["missed"] as int?,
        saved: json["saved"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "won": won,
        "commited": committed,
        "scored": scored,
        "missed": missed,
        "saved": saved,
    };
}