class Session {
  final String dateText;
  final String title;
  final String description;
  final bool isButtonEnabled;

  const Session({
    required this.dateText,
    required this.title,
    required this.description,
    this.isButtonEnabled = false,
  });

  // Factory constructor for JSON parsing (optional)
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      dateText: json['dateText'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isButtonEnabled: json['isButtonEnabled'] ?? false,
    );
  }

  // Convert to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'dateText': dateText,
      'title': title,
      'description': description,
      'isButtonEnabled': isButtonEnabled,
    };
  }

  // Copy with new values (optional for immutability)
  Session copyWith({
    String? dateText,
    String? title,
    String? description,
    bool? isButtonEnabled,
  }) {
    return Session(
      dateText: dateText ?? this.dateText,
      title: title ?? this.title,
      description: description ?? this.description,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
