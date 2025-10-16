import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/profile/model/user_profile_model.dart';
import 'package:oracle_card_app/features/users/profile/repository/user_profile_repository.dart';

import '../../../../core/helpers/user_session_helper.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';
part 'user_profile_bloc.freezed.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _userProfileRepository;
  UserProfileBloc({required UserProfileRepository repo})
    : _userProfileRepository = repo,
      super(UserProfileState.initial()) {
    on<_GetUserProfileEvent>(_onGetUserProfile);
  }

  Future<void> _onGetUserProfile(
    _GetUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileState.loading());

    final result = await _userProfileRepository.getUserProfile();

    result.fold((failure) => emit(UserProfileState.failure(failure)), (
      userProfileData,
    ) {
      //TODO:
      UserPlanType().updateFromProfile(userProfileData);

      emit(UserProfileState.loaded(userProfileData));
    });
  }
}
