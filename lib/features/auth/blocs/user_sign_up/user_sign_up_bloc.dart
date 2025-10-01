import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/auth/repository/auth_repository.dart';

import '../../models/sign_up_model.dart';

part 'user_sign_up_event.dart';
part 'user_sign_up_state.dart';
part 'user_sign_up_bloc.freezed.dart';

class UserSignUpBloc extends Bloc<UserSignUpEvent, UserSignUpState> {
  final AuthRepository _authRepository;
  UserSignUpBloc({required AuthRepository repo})
    : _authRepository = repo,
      super(UserSignUpState.initial()) {
    on<_UserSignUpModelEvent>(_onUserSignUp);
  }

  Future<void> _onUserSignUp(
    _UserSignUpModelEvent event,
    Emitter<UserSignUpState> emit,
  ) async {
    emit(UserSignUpState.loading());

    final result = await _authRepository.signUp(signUpModel: event.signUpModel);

    result.fold(
      (failure) => emit(UserSignUpState.failure(failure)),
      (userSignUpData) => emit(UserSignUpState.loaded(userSignUpData)),
    );
  }
}
