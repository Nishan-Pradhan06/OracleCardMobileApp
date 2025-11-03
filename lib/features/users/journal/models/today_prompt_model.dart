class PromptModel {
  final TodayPromptModel prompt;

  PromptModel({required this.prompt});

  factory PromptModel.fromJson(dynamic json) {
    if (json == null || json is! Map<String, dynamic>) {
      return PromptModel(
        prompt: TodayPromptModel(
          id: 0,
          text: '',
          visibility: '',
          isActive: false,
        ),
      );
    }

    return PromptModel(prompt: TodayPromptModel.fromJson(json['prompt'] ?? {}));
  }

  Map<String, dynamic> toJson() => {'prompt': prompt.toJson()};
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
