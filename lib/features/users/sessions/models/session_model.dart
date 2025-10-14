class Session {
  final String dateTime;
  final String title;
  final String description;
  final bool isButtonEnabled;

  const Session({
    required this.dateTime,
    required this.title,
    required this.description,
    this.isButtonEnabled = false,
  });

  // Factory constructor for JSON parsing (optional)
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      dateTime: json['dateTime'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isButtonEnabled: json['isButtonEnabled'] ?? false,
    );
  }

  // Convert to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'title': title,
      'description': description,
      'isButtonEnabled': isButtonEnabled,
    };
  }

  // Copy with new values (optional for immutability)
  Session copyWith({
    String? dateTime,
    String? title,
    String? description,
    bool? isButtonEnabled,
  }) {
    return Session(
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      description: description ?? this.description,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
