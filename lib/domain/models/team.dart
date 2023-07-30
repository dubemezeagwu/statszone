class Team {
  final int? id;
  final String? code;
  final String? name;
  final String? country;
  final String? logo;
  final int? founded;
  final bool? national;

  Team(
      {this.id,
      this.code,
      this.name,
      this.country,
      this.logo,
      this.founded,
      this.national});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"] as int?,
      name: json["name"] as String?,
      code: json["code"] as String?,
      country: json["country"] as String?,
      logo: json["logo"] as String?,
      founded: json["founded"] as int?,
      national: json["national"] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "country": country,
    "logo": logo,
    "founded": founded,
    "national": national
  };
}
