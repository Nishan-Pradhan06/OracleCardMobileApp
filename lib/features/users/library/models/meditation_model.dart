

class MeditationModel {
  final List<MeditationItemModel> items;
  final String? nextCursor;

  MeditationModel({required this.items, this.nextCursor});

  factory MeditationModel.fromJson(Map<String, dynamic> json) {
    return MeditationModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => MeditationItemModel.fromJson(e))
          .toList(),
      nextCursor: json['nextCursor'],
    );
  }

  Map<String, dynamic> toJson() => {
    'items': items.map((e) => e.toJson()).toList(),
    'nextCursor': nextCursor,
  };
}

class MeditationItemModel {
  final int id;
  final String title;
  final int durationSec;
  final String visibility;
  final bool locked;

  MeditationItemModel({
    required this.id,
    required this.title,
    required this.durationSec,
    required this.visibility,
    required this.locked,
  });

  factory MeditationItemModel.fromJson(Map<String, dynamic> json) {
    return MeditationItemModel(
      id: json['id'],
      title: json['title'],
      durationSec: json['durationSec'],
      visibility: json['visibility'],
      locked: json['locked'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'durationSec': durationSec,
    'visibility': visibility,
    'locked': locked,
  };
}
