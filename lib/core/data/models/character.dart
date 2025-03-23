class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;
  bool isFavorite;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    this.isFavorite = false,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    try {
      return Character(
        id: json['id'] as int,
        name: json['name'] as String,
        status: json['status'] as String,
        species: json['species'] as String,
        type: json['type'] as String,
        gender: json['gender'] as String,
        origin: Location.fromJson(Map<String, dynamic>.from(json['origin'] as Map)),
        location: Location.fromJson(Map<String, dynamic>.from(json['location'] as Map)),
        image: json['image'] as String,
        episode: (json['episode'] as List).map((e) => e as String).toList(),
        url: json['url'] as String,
        created: DateTime.parse(json['created'] as String),
      );
    } catch (e) {
      throw FormatException('Failed to create Character from JSON: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toJson(),
      'location': location.toJson(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created.toIso8601String(),
    };
  }
}

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
