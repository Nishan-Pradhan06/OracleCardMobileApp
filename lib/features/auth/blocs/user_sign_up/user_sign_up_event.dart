part of 'user_sign_up_bloc.dart';

@freezed
abstract class UserSignUpEvent with _$UserSignUpEvent {
  const factory UserSignUpEvent.userSignUp(SignUpModel signUpModel) =
      _UserSignUpModelEvent;
}
