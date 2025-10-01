part of 'user_sign_in_bloc.dart';

@freezed
abstract class UserSignInEvent with _$UserSignInEvent {
  const factory UserSignInEvent.userSignIn(SignInModel userSignInModel) =
      _UserSignInModelEvent;
}
