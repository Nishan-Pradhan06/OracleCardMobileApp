import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/library/models/meditation_model.dart';
import 'package:oracle_card_app/features/users/library/repository/meditations_repository.dart';

part 'get_meditations_event.dart';
part 'get_meditations_state.dart';
part 'get_meditations_bloc.freezed.dart';

class GetMeditationsBloc
    extends Bloc<GetMeditationsEvent, GetMeditationsState> {
  final MeditationsRepository _meditationsRepository;
  GetMeditationsBloc({required MeditationsRepository repo})
    : _meditationsRepository = repo,
      super(GetMeditationsState.initial()) {
    on<_GetMeditationsE>(_onGetMeditations);
  }

  Future<void> _onGetMeditations(
    _GetMeditationsE event,
    Emitter<GetMeditationsState> emit,
  ) async {
    emit(GetMeditationsState.loading());

    await Future.delayed(Duration(seconds: 3));

    final result = await _meditationsRepository.getMeditations();

    result.fold(
      (failure) => emit(GetMeditationsState.loading()),
      (data) => emit(GetMeditationsState.loaded(data)),
    );
  }
}
