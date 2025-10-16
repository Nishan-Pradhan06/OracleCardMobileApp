import 'package:flutter/material.dart';
import 'package:oracle_card_app/features/users/profile/model/user_profile_model.dart';
//TODO:
class UserPlanType extends ChangeNotifier {
  static final UserPlanType _instance = UserPlanType._internal();
  factory UserPlanType() => _instance;
  UserPlanType._internal();

  String? plan;
  String? name;
  String? email;

  void updateFromProfile(UserProfileModel profile) {
    plan = profile.user.plan;
    name = profile.user.name;
    email = profile.user.email;
    notifyListeners();
  }

  bool get isPremium => plan?.toUpperCase() == 'PREMIUM';
  bool get isFree => plan?.toUpperCase() == 'FREE';
}
