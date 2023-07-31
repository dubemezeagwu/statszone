class Dribble {
    final int? attempts;
    final int? success;
    final int? past;

    Dribble({
        this.attempts,
        this.success,
        this.past,
    });

    factory Dribble.fromJson(Map<String, dynamic> json) => Dribble(
        attempts: json["attempts"] as int?,
        success: json["success"] as int?,
        past: json["past"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "past": past,
    };
}
