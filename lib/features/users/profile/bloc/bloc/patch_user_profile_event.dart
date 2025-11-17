part of 'patch_user_profile_bloc.dart';

@freezed
abstract class PatchUserProfileEvent with _$PatchUserProfileEvent {
  const factory PatchUserProfileEvent.patchUserProfile({required UserProfileModel userProfileModel}) = _PatchUserProfileE;
}