class GuidanceMetrics {
  final int delivered;
  final int opened;

  GuidanceMetrics({required this.delivered, required this.opened});

  factory GuidanceMetrics.fromJson(Map<String, dynamic> json) {
    return GuidanceMetrics(
      delivered: json['delivered'] ?? 0,
      opened: json['opened'] ?? 0,
    );
  }
}
