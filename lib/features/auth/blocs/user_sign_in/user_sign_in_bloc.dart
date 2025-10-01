import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/features/auth/repository/auth_repository.dart';
import '../../models/sign_in_model.dart';

part 'user_sign_in_event.dart';
part 'user_sign_in_state.dart';
part 'user_sign_in_bloc.freezed.dart';

class UserSignInBloc extends Bloc<UserSignInEvent, UserSignInState> {
  final AuthRepository _authRepository;
  UserSignInBloc({required AuthRepository repo})
    : _authRepository = repo,
      super(UserSignInState.initial()) {
    on<_UserSignInModelEvent>(_onUserSignIn);
  }

  Future<void> _onUserSignIn(
    _UserSignInModelEvent event,
    Emitter<UserSignInState> emit,
  ) async {
    emit(UserSignInState.loading());

    final result = await _authRepository.signIn(
      signInModel: event.userSignInModel,
    );

    result.fold(
      (failure) => emit(UserSignInState.failure(failure)),
      (signInData) => emit(UserSignInState.loaded(signInData)),
    );
  }
}
