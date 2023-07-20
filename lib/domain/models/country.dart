class Country {
  final String? name;
  final String? code;
  final String? flag;

  Country({
    this.name,
    this.code,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"] as String?,
    code: json["code"] as String?,
    flag: json["flag"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "flag": flag,
  };
}