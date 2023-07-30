class Player {
  final String? name;
  final String? firstName;
  final String? lastName;
  final int? id, age;
  final _DateOfBirth? dateOfBirth;
  final String? nationality;
  final String? height;
  final String? weight;
  final bool? injured;
  final String? image;

  Player({
    this.name,
    this.firstName,
    this.lastName,
    this.id,
    this.age,
    this.dateOfBirth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.image});

  factory Player.fromJson (Map<String, dynamic> json) {
    return Player(
      id: json["id"] as int?,
      name: json["name"] as String?,
      firstName: json["firstName"] as String?,
      lastName: json["lastName"] as String?,
      age: json["age"] as int?,
      dateOfBirth: json["birth"] as _DateOfBirth?,
      nationality: json["nationality"] as String?,
      height: json["height"] as String?,
      weight: json["weight"] as String?,
      injured: json["injured"] as bool?,
      image: json["image"] as String?,
    );
  }

  Map<String, dynamic> toJson () => {
    "id": id,
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "age": age,
    "birth": dateOfBirth?.toJson(),
    "nationality": nationality,
    "height": height,
    "weight": weight,
    "injured": injured,
    "image": image
  };

}

class _DateOfBirth {
  final String? date;
  final String? place;
  final String? country;

  _DateOfBirth({this.date, this.place, this.country,});

  factory _DateOfBirth.fromJson (Map<String, dynamic> json){
    return _DateOfBirth(
      date: json["date"] as String?,
      place: json["place"] as String?,
      country: json["country"] as String?
    );
  }

  Map<String, dynamic> toJson (){
    return {
      "date" : date,
      "place": place,
      "country": country
    };
  }
}