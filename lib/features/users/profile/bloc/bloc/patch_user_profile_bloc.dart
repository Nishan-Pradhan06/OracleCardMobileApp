import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/profile/model/user_profile_model.dart';
import 'package:oracle_card_app/features/users/profile/repository/user_profile_repository.dart';

part 'patch_user_profile_event.dart';
part 'patch_user_profile_state.dart';
part 'patch_user_profile_bloc.freezed.dart';

class PatchUserProfileBloc
    extends Bloc<PatchUserProfileEvent, PatchUserProfileState> {
  final UserProfileRepository _profileRepository;
  PatchUserProfileBloc({required UserProfileRepository repo})
    : _profileRepository = repo,
      super(PatchUserProfileState.initial()) {
    on<_PatchUserProfileE>(_onPatchUserProfile);
  }

  Future<void> _onPatchUserProfile(
    _PatchUserProfileE event,
    Emitter<PatchUserProfileState> emit,
  ) async {
    emit(PatchUserProfileState.loading());

    final result = await _profileRepository.patchUserProfile(
      userProfileModel: event.userProfileModel,
    );

    result.fold(
      (failure) => emit(PatchUserProfileState.failure(failure)),
      (data) => emit(PatchUserProfileState.loaded(data)),
    );
  }
}
