// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:statszone/domain/app_domain.dart';

class MiniPlayer extends Equatable {
  final String? name;
  final String? position;
  final String? photo;
  final int? id, age, number;

  const MiniPlayer(
      {required this.name,
      required this.position,
      required this.id,
      required this.photo,
      required this.age,
      required this.number});

  factory MiniPlayer.fromJson(Map<String, dynamic> json) {
    return MiniPlayer(
        id: json["id"] as int?,
        name: json["name"] as String?,
        position: json["position"] as String?,
        age: json["age"] as int?,
        number: json["number"] as int?,
        photo: json["photo"] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "position": position,
      "number": number,
      "photo": photo,
    };
  }

  @override
  List<Object?> get props => [];
}
