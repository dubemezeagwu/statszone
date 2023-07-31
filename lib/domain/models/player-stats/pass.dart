class Pass {
    final int? total;
    final int? key;
    final int? accuracy;

    Pass({
        this.total,
        this.key,
        this.accuracy,
    });

    factory Pass.fromJson(Map<String, dynamic> json) => Pass(
        total: json["total"] as int?,
        key: json["key"] as int?,
        accuracy: json["accuracy"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
    };
}