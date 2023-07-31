class Game {
    final int? appearences;
    final int? lineups;
    final int? minutes;
    final dynamic number;
    final String position;
    final double? rating;
    final bool captain;

    Game({
        this.appearences,
        this.lineups,
        this.minutes,
        this.number,
        required this.position,
        this.rating,
        required this.captain,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        appearences: json["appearences"] as int?,
        lineups: json["lineups"] as int?,
        minutes: json["minutes"] as int?,
        number: json["number"],
        position: json["position"] as String,
        rating: json["rating"] as double?,
        captain: json["captain"] as bool,
    );

    Map<String, dynamic> toJson() => {
        "appearences": appearences,
        "lineups": lineups,
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
    };
}