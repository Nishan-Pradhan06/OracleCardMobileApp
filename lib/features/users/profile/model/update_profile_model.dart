class PatchUserProfle {
  final String? name;
  final bool? pushEnabled;

  PatchUserProfle({this.name, this.pushEnabled});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (name != null) map["name"] = name;
    if (pushEnabled != null) map["pushEnabled"] = pushEnabled;

    return map;
  }
}
