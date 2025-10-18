class MeditationDataModel {
  final int id;
  final String title;
  final String description;
  final int durationSec;
  final String visibility;
  final bool isDownloadable;
  final MediaData? media;

  MeditationDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.durationSec,
    required this.visibility,
    required this.isDownloadable,
    this.media,
  });

  factory MeditationDataModel.fromJson(Map<String, dynamic> json) {
    return MeditationDataModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      durationSec: json['durationSec'] ?? 0,
      visibility: json['visibility'] ?? '',
      isDownloadable: json['isDownloadable'] ?? false,
      media: json['media'] != null ? MediaData.fromJson(json['media']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'durationSec': durationSec,
      'visibility': visibility,
      'isDownloadable': isDownloadable,
      'media': media?.toJson(),
    };
  }
}

class MediaData {
  final String type;
  final String streamUrl;

  MediaData({required this.type, required this.streamUrl});

  factory MediaData.fromJson(Map<String, dynamic> json) {
    return MediaData(
      type: json['type'] ?? '',
      streamUrl: json['streamUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'streamUrl': streamUrl};
  }
}
