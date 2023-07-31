class Goal {
    final int? total;
    final int? conceded;
    final int? assists;
    final int? saves;

    Goal({
        this.total,
        this.conceded,
        this.assists,
        this.saves,
    });

    factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        total: json["total"] as  int?,
        conceded: json["conceded"] as  int?,
        assists: json["assists"] as  int?,
        saves: json["saves"] as  int?,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "conceded": conceded,
        "assists": assists,
        "saves": saves,
    };
}