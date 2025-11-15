class GetDailyGuidanceAdminModel {
  final int id;
  final String title;
  final String message;
  final String scheduledAt;
  final String visibility;
  final int? audioMediaId;
  final int createdById;
  final bool isActive;
  final String createdAt;
  final AudioMediaModel? audioMedia;

  GetDailyGuidanceAdminModel({
    required this.id,
    required this.title,
    required this.message,
    required this.scheduledAt,
    required this.visibility,
    required this.audioMediaId,
    required this.createdById,
    required this.isActive,
    required this.createdAt,
    required this.audioMedia,
  });

  factory GetDailyGuidanceAdminModel.fromJson(Map<String, dynamic> json) {
    return GetDailyGuidanceAdminModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      message: json["message"] ?? "",
      scheduledAt: json["scheduledAt"] ?? "",
      visibility: json["visibility"] ?? "",
      audioMediaId: json["audioMediaId"],
      createdById: json["createdById"] ?? 0,
      isActive: json["isActive"] ?? false,
      createdAt: json["createdAt"] ?? "",
      audioMedia: json["audioMedia"] != null
          ? AudioMediaModel.fromJson(json["audioMedia"])
          : null,
    );
  }
}

class AudioMediaModel {
  final int id;
  final String type;
  final String title;
  final String description;
  final String url;
  final int durationSec;
  final String visibility;
  final int uploadedById;
  final String createdAt;

  AudioMediaModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.url,
    required this.durationSec,
    required this.visibility,
    required this.uploadedById,
    required this.createdAt,
  });

  factory AudioMediaModel.fromJson(Map<String, dynamic> json) =>
      AudioMediaModel(
        id: json["id"] ?? 0,
        type: json["type"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        durationSec: json["durationSec"] ?? 0,
        visibility: json["visibility"] ?? "",
        uploadedById: json["uploadedById"] ?? 0,
        createdAt: json["createdAt"] ?? "",
      );
}
