class League {
  final int? id;
  final String? name;
  final String? type;
  final String? logo;

  League({this.id, this.name, this.type, this.logo});

  factory League.fromJson (Map<String, dynamic> json){
    return League(
      id: json["id"] as int?,
      name: json["name"] as String?,
      type: json["type"] as String?,
      logo: json["logo"] as String?
    );
  }

  Map<String, dynamic> toJson() => {
    "name" : name,
    "id": id,
    "type" : type,
    "logo" : logo,
  };
}