import 'dart:convert';

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
