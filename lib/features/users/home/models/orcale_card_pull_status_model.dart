import 'dart:convert';

class OrcaleCardPullStatusModel {
  final bool allowed;
  final int remaining;
  final DateTime? lastPulledAt;

  OrcaleCardPullStatusModel({
    required this.allowed,
    required this.remaining,
    this.lastPulledAt,
  });

  factory OrcaleCardPullStatusModel.fromMap(Map<String, dynamic> map) {
    return OrcaleCardPullStatusModel(
      allowed: map['allowed'] ?? false,
      remaining: map['remaining'] ?? 0,
      lastPulledAt: map['lastPulledAt'] != null
          ? DateTime.tryParse(map['lastPulledAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'allowed': allowed,
      'remaining': remaining,
      'lastPulledAt': lastPulledAt?.toIso8601String(),
    };
  }

  factory OrcaleCardPullStatusModel.fromJson(String source) =>
      OrcaleCardPullStatusModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
