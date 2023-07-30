class Venue {
  final String? name;
  final int? id;
  final int? capacity;
  final String? address;
  final String? city;
  final String? image;
  final String? surface;

  Venue(
      {this.name,
      this.id,
      this.capacity,
      this.address,
      this.city,
      this.image,
      this.surface});

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"] as int?,
      capacity: json["capacity"] as int?,
      name: json["name"] as String?,
      address: json["address"] as String?,
      city: json["city"] as String?,
      image: json["image"] as String?,
      surface: json["surface"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "capacity": capacity,
    "name": name,
    "address": address,
    "city": city,
    "image": image,
    "surface": surface
  };
}
