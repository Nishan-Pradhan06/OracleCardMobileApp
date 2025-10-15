import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/profile/model/user_profile_model.dart';

abstract interface class UserProfileRepository {
  //##-------------------GET USER PROFILE-------------------------##
  FutureEither<UserProfileModel> getUserProfile();
}

class UserProfileRepositoryImpl implements UserProfileRepository {
  final ApiService _apiService;
  UserProfileRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------GET USER PROFILE-------------------------##
  @override
  FutureEither<UserProfileModel> getUserProfile() async {
    final response = await _apiService.get<Map>('profile');

    return response.fold((failure) => Left(failure), (profileData) {
      final userJson = profileData['data'];

      final user = UserProfileModel.fromJson(userJson);
      return Right(user);
    });
  }
}
