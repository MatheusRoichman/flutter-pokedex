import 'dart:convert';

class PokemonModel {
  final int id;
  final String? number;
  final String? name;
  final List<String> types;
  final String image;

  PokemonModel(
      {required this.id, this.number, this.name, this.types = const [], this.image = "https://via.placeholder.com/150"});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'number': number,
      'name': name,
      'types': types,
      'image': image,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] ?? '',
      number: map['number'] != null ? map['number'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      types: List<String>.from(map['types'] ?? []),
      image: map['image'] ?? 'https://via.placeholder.com/150',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}