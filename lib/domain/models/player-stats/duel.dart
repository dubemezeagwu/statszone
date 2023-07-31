class Duel {
    final int? total;
    final int? won;

    Duel({
        this.total,
        this.won,
    });

    factory Duel.fromJson(Map<String, dynamic> json) => Duel(
        total: json["total"] as int?,
        won: json["won"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
    };
}