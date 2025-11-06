import 'dart:convert';

//POST MODEL
class DeckCardModel {
  final String name;
  final String description;
  final bool isActive;

  DeckCardModel({
    required this.name,
    required this.description,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }

  factory DeckCardModel.fromMap(Map<String, dynamic> map) {
    return DeckCardModel(
      name: map['name'] as String,
      description: map['description'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeckCardModel.fromJson(String source) =>
      DeckCardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

//GET MODELimport

class AdminDeckModel {
  final int id;
  final String name;
  final String description;
  final bool isActive;

  AdminDeckModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
  });

  factory AdminDeckModel.fromMap(Map<String, dynamic> map) {
    return AdminDeckModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isActive: map['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }

  factory AdminDeckModel.fromJson(String source) =>
      AdminDeckModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
