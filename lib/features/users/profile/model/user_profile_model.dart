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
}

class User {
  final int id;
  final String email;
  final String? name;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    this.name,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
