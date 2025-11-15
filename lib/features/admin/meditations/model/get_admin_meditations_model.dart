/// Meditation model
class GetAdminMeditationModel {
  final int id;
  final String title;
  final String? description;
  final int? mediaId;
  final VisibilityModel visibility;
  final bool isDownloadable;
  final bool isActive;
  final MediaModel? media;

  GetAdminMeditationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaId,
    required this.visibility,
    required this.isDownloadable,
    required this.isActive,
    required this.media,
  });

  factory GetAdminMeditationModel.fromJson(Map<String, dynamic> json) => GetAdminMeditationModel(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String?,
    mediaId: json['mediaId'] != null ? json['mediaId'] as int : null,
    visibility: VisibilityHelper.fromString(json['visibility'] as String?),
    isDownloadable: json['isDownloadable'] as bool? ?? false,
    isActive: json['isActive'] as bool? ?? false,
    media: json['media'] != null
        ? MediaModel.fromJson(json['media'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'mediaId': mediaId,
    'visibility': VisibilityHelper.toShortString(visibility),
    'isDownloadable': isDownloadable,
    'isActive': isActive,
    'media': media?.toJson(),
  };

  @override
  String toString() => 'Meditation(id: $id, title: $title)';
}

/// Media model
class MediaModel {
  final int id;
  final MediaTypeModel type;
  final String title;
  final String? description;
  final String url;
  final int? durationSec;
  final VisibilityModel visibility;
  final int? uploadedById;
  final DateTime? createdAt;

  MediaModel({
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

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
    id: json['id'] as int,
    type: MediaTypeHelper.fromString(json['type'] as String?),
    title: json['title'] as String? ?? '',
    description: json['description'] as String?,
    // keep url as-is (might contain backslashes in some responses)
    url: (json['url'] as String?) ?? '',
    durationSec: json['durationSec'] is int
        ? json['durationSec'] as int
        : (json['durationSec'] is String
              ? int.tryParse(json['durationSec'] as String)
              : null),
    visibility: VisibilityHelper.fromString(json['visibility'] as String?),
    uploadedById: json['uploadedById'] != null
        ? json['uploadedById'] as int
        : null,
    createdAt: json['createdAt'] != null
        ? DateTime.tryParse(json['createdAt'] as String)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': MediaTypeHelper.toShortString(type),
    'title': title,
    'description': description,
    'url': url,
    'durationSec': durationSec,
    'visibility': VisibilityHelper.toShortString(visibility),
    'uploadedById': uploadedById,
    'createdAt': createdAt?.toIso8601String(),
  };

  @override
  String toString() => 'Media(id: $id, title: $title, url: $url)';
}

/// Visibility enum + helpers
enum VisibilityModel { free, premium, unknown }

class VisibilityHelper {
  static VisibilityModel fromString(String? s) {
    if (s == null) return VisibilityModel.unknown;
    final lower = s.toUpperCase();
    switch (lower) {
      case 'FREE':
        return VisibilityModel.free;
      case 'PREMIUM':
        return VisibilityModel.premium;
      default:
        return VisibilityModel.unknown;
    }
  }

  static String toShortString(VisibilityModel v) {
    switch (v) {
      case VisibilityModel.free:
        return 'FREE';
      case VisibilityModel.premium:
        return 'PREMIUM';
      default:
        return 'UNKNOWN';
    }
  }
}

/// MediaType enum + helpers
enum MediaTypeModel { audio, video, image, unknown }

class MediaTypeHelper {
  static MediaTypeModel fromString(String? s) {
    if (s == null) return MediaTypeModel.unknown;
    final upper = s.toUpperCase();
    switch (upper) {
      case 'AUDIO':
        return MediaTypeModel.audio;
      case 'VIDEO':
        return MediaTypeModel.video;
      case 'IMAGE':
        return MediaTypeModel.image;
      default:
        return MediaTypeModel.unknown;
    }
  }

  static String toShortString(MediaTypeModel t) {
    switch (t) {
      case MediaTypeModel.audio:
        return 'AUDIO';
      case MediaTypeModel.video:
        return 'VIDEO';
      case MediaTypeModel.image:
        return 'IMAGE';
      default:
        return 'UNKNOWN';
    }
  }
}
