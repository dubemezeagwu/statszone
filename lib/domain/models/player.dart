import 'package:statszone/domain/app_domain.dart';

class Player extends Equatable {
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

  const Player({
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

  Player copyWith ({
    String? name,
    String? firstName,
    String? lastName,
    int? id,
    int? age,
    _DateOfBirth? dateOfBirth,
    String? nationality,
    String? height,
    String? weight,
    bool? injured,
    String? image
  }) => Player(
    id: id ?? this.id,
    name: name ?? this.name,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    age: age ?? this.age,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    nationality: nationality ?? this.nationality,
    height: height ?? this.height,
    weight: weight ?? this.weight,
    injured: injured ?? this.injured,
    image: image ?? this.image
  );  

  factory Player.fromJson (Map<String, dynamic> json) {
    return Player(
      id: json["id"] as int?,
      name: json["name"] as String?,
      firstName: json["firstname"] as String?,
      lastName: json["lastname"] as String?,
      age: json["age"] as int?,
      dateOfBirth: _DateOfBirth.fromJson(json["birth"]),
      nationality: json["nationality"] as String?,
      height: json["height"] as String?,
      weight: json["weight"] as String?,
      injured: json["injured"] as bool?,
      image: json["photo"] as String?,
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

  Map<String, dynamic> toDatabaseJson () => {
    "_id": id,
    "name": name,
    "firstName": firstName,
    "lastName": lastName,
    "age": age,
    "birth": dateOfBirth?.toJson(),
    "nationality": nationality,
    "height": height,
    "weight": weight,
    "injured": injured! ? 1 : 0,
    "image": image
  };
  
  @override
  List<Object?> get props => 
  [id, name, firstName, lastName, age, 
  dateOfBirth, nationality, height, weight, injured, image];

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