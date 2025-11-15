
class GetDailyGuidanceAdminModel {
  final int id;
  final String title;
  final String message;
  final String scheduledAt;
  final String visibility;
  final int audioMediaId;
  final int createdById;
  final bool isActive;
  final String createdAt;
  final AudioMediaModel audioMedia;

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
      id: json["id"],
      title: json["title"],
      message: json["message"],
      scheduledAt: json["scheduledAt"],
      visibility: json["visibility"],
      audioMediaId: json["audioMediaId"],
      createdById: json["createdById"],
      isActive: json["isActive"],
      createdAt: json["createdAt"],
      audioMedia: AudioMediaModel.fromJson(json["audioMedia"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "scheduledAt": scheduledAt,
    "visibility": visibility,
    "audioMediaId": audioMediaId,
    "createdById": createdById,
    "isActive": isActive,
    "createdAt": createdAt,
    "audioMedia": audioMedia.toJson(),
  };
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

  factory AudioMediaModel.fromJson(Map<String, dynamic> json) => AudioMediaModel(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    durationSec: json["durationSec"],
    visibility: json["visibility"],
    uploadedById: json["uploadedById"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "description": description,
    "url": url,
    "durationSec": durationSec,
    "visibility": visibility,
    "uploadedById": uploadedById,
    "createdAt": createdAt,
  };
}
