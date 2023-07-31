class Foul {
    final int? drawn;
    final int? committed;

    Foul({
        required this.drawn,
        required this.committed,
    });

    factory Foul.fromJson(Map<String, dynamic> json) => Foul(
        drawn: json["drawn"] as int?,
        committed: json["committed"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
    };
}