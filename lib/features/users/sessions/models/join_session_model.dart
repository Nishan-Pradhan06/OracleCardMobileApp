import 'session_model.dart';

class JoinLinkDataModel {
  final String joinUrl;
  final SessionItemModel? session;

  JoinLinkDataModel({required this.joinUrl, this.session});

  factory JoinLinkDataModel.fromJson(Map<String, dynamic> json) {
    return JoinLinkDataModel(
      joinUrl: json['joinUrl'] ?? '',
      session: json['session'] != null
          ? SessionItemModel.fromJson(json['session'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'joinUrl': joinUrl, 'session': session?.toJson()};
  }
}
