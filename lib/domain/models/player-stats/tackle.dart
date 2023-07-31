class Tackle {
    final int? total;
    final int? blocks;
    final int? interceptions;

    Tackle({
        this.total,
        this.blocks,
        this.interceptions,
    });

    factory Tackle.fromJson(Map<String, dynamic> json) => Tackle(
        total: json["total"] as int?,
        blocks: json["blocks"] as int?,
        interceptions: json["interceptions"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "blocks": blocks,
        "interceptions": interceptions,
    };
}