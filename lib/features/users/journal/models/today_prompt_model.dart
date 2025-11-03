class PromptModel {
  final int id;
  final String text;
  final String visibility;
  final bool isActive;

  PromptModel({
    required this.id,
    required this.text,
    required this.visibility,
    required this.isActive,
  });

  factory PromptModel.empty() {
    return PromptModel(id: -1, text: '', visibility: 'false', isActive: false);
  }
  factory PromptModel.fromJson(Map<String, dynamic> json) {
    return PromptModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      text: json['text']?.toString() ?? '',
      visibility: json['visibility']?.toString() ?? '',
      isActive:
          json['isActive'] == true ||
          json['isActive']?.toString().toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'visibility': visibility,
    'isActive': isActive,
  };
}

class TodayPromptModel {
  final int id;
  final String text;
  final String visibility;
  final bool isActive;

  TodayPromptModel({
    required this.id,
    required this.text,
    required this.visibility,
    required this.isActive,
  });

  factory TodayPromptModel.fromJson(Map<String, dynamic> json) {
    return TodayPromptModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      text: json['text']?.toString() ?? '',
      visibility: json['visibility']?.toString() ?? '',
      isActive:
          json['isActive'] == true ||
          json['isActive']?.toString().toLowerCase() == 'true',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'visibility': visibility,
    'isActive': isActive,
  };
}
