class UserProfileModel {
  final int id;
  final int userId;
  final String? timezone;
  final String? bio;
  final bool pushEnabled;
  final User user;

  UserProfileModel({
    required this.id,
    required this.userId,
    this.timezone,
    this.bio,
    required this.pushEnabled,
    required this.user,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      userId: json['userId'],
      timezone: json['timezone'],
      bio: json['bio'],
      pushEnabled: json['pushEnabled'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'timezone': timezone,
      'bio': bio,
      'pushEnabled': pushEnabled,
    };
  }
}

class User {
  final int id;
  final String email;
  final String? name;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String plan;
  final List<dynamic> subscriptions;
  final UserCount count;

  User({
    required this.id,
    required this.email,
    this.name,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.plan,
    required this.subscriptions,
    required this.count,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      plan: json['plan'] ?? 'FREE',
      subscriptions: json['subscriptions'] ?? [],
      count: UserCount.fromJson(json['_count']),
    );
  }
}

class UserCount {
  final int journalEntries;
  final int oraclePulls;
  final int userMeditationActivities;

  UserCount({
    required this.journalEntries,
    required this.oraclePulls,
    required this.userMeditationActivities,
  });

  factory UserCount.fromJson(Map<String, dynamic> json) {
    return UserCount(
      journalEntries: json['journalEntries'] ?? 0,
      oraclePulls: json['oraclePulls'] ?? 0,
      userMeditationActivities: json['userMeditationActivities'] ?? 0,
    );
  }
}
