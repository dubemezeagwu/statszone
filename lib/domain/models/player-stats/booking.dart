class Booking {
  final int? yellow;
  final int? yellowRed;
  final int? red;

  Booking({
    required this.yellow,
    required this.yellowRed,
    required this.red,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        yellow: json["yellow"] as int?,
        yellowRed: json["yellowred"] as int?,
        red: json["red"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "yellow": yellow,
        "yellowred": yellowRed,
        "red": red,
      };
}
