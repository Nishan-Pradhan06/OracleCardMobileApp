import 'dart:convert';

/// Data wrapper containing items and total
class DataListModel {
  final List<UserModel> items;
  final int total;

  DataListModel({required this.items, required this.total});

  factory DataListModel.fromJson(Map<String, dynamic> json) => DataListModel(
    items: (json['items'] as List<dynamic>)
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    total: json['total'] as int,
  );

  Map<String, dynamic> toJson() => {
    'items': items.map((u) => u.toJson()).toList(),
    'total': total,
  };
}

/// User model
class UserModel {
  final int id;
  final String? name; // Nullable
  final String email;
  final String plan;
  final SubscriptionModel subscription;
  final ActivityModel activity;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  UserModel({
    required this.id,
    this.name,
    required this.email,
    required this.plan,
    required this.subscription,
    required this.activity,
    required this.createdAt,
    this.lastLoginAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int,
    name: json['name'] as String?, // handle null
    email: json['email'] as String,
    plan: json['plan'] as String,
    subscription: SubscriptionModel.fromJson(
      json['subscription'] as Map<String, dynamic>,
    ),
    activity: ActivityModel.fromJson(json['activity'] as Map<String, dynamic>),
    createdAt: DateTime.parse(json['createdAt'] as String),
    lastLoginAt: json['lastLoginAt'] != null
        ? DateTime.parse(json['lastLoginAt'] as String)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'plan': plan,
    'subscription': subscription.toJson(),
    'activity': activity.toJson(),
    'createdAt': createdAt.toIso8601String(),
    'lastLoginAt': lastLoginAt?.toIso8601String(),
  };

  @override
  String toString() => jsonEncode(toJson());
}

/// Subscription nested object
class SubscriptionModel {
  final String status;
  final DateTime? nextBillingDate;

  SubscriptionModel({required this.status, this.nextBillingDate});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        status: json['status'] as String,
        nextBillingDate: json['nextBillingDate'] != null
            ? DateTime.parse(json['nextBillingDate'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'nextBillingDate': nextBillingDate?.toIso8601String(),
  };

  @override
  String toString() => jsonEncode(toJson());
}

/// Activity nested object
class ActivityModel {
  final int pulls;
  final int journals;
  final int meditations;

  ActivityModel({
    required this.pulls,
    required this.journals,
    required this.meditations,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    pulls: (json['pulls'] as num).toInt(),
    journals: (json['journals'] as num).toInt(),
    meditations: (json['meditations'] as num).toInt(),
  );

  Map<String, dynamic> toJson() => {
    'pulls': pulls,
    'journals': journals,
    'meditations': meditations,
  };

  @override
  String toString() => jsonEncode(toJson());
}
