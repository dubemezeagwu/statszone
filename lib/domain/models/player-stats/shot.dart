class Shot {
    final int? total;
    final int? onTarget;

    Shot({
        required this.total,
        this.onTarget,
    });

    factory Shot.fromJson(Map<String, dynamic> json) => Shot(
        total: json["total"] as int?,
        onTarget: json["on"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "on": onTarget,
    };
}
