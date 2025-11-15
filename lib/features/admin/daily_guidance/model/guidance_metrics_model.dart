class GuidanceMetricsModel {
  final int delivered;
  final int opened;

  GuidanceMetricsModel({required this.delivered, required this.opened});

  factory GuidanceMetricsModel.fromJson(Map<String, dynamic> json) {
    return GuidanceMetricsModel(
      delivered: json['delivered'] ?? 0,
      opened: json['opened'] ?? 0,
    );
  }
}
