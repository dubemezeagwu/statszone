class Substitution {
    
    final int? substitutionIn;
    final int? out;
    final int ?bench;

    Substitution({
        required this.substitutionIn,
        required this.out,
        required this.bench,
    });

    factory Substitution.fromJson(Map<String, dynamic> json) => Substitution(
        substitutionIn: json["in"] as int?,
        out: json["out"] as int?,
        bench: json["bench"] as int?,
    );

    Map<String, dynamic> toJson() => {
        "in": substitutionIn,
        "out": out,
        "bench": bench,
    };
}
