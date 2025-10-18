import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/library/models/meditation_by_id_model.dart';
import 'package:oracle_card_app/features/users/library/repository/meditations_repository.dart';

part 'get_meditations_by_id_event.dart';
part 'get_meditations_by_id_state.dart';
part 'get_meditations_by_id_bloc.freezed.dart';

class GetMeditationsByIdBloc
    extends Bloc<GetMeditationsByIdEvent, GetMeditationsByIdState> {
  final MeditationsRepository _meditationsRepository;
  GetMeditationsByIdBloc({required MeditationsRepository repo})
    : _meditationsRepository = repo,
      super(GetMeditationsByIdState.initial()) {
    on<_GetMeditationsByIdE>(_onGetMeditationById);
  }
  Future<void> _onGetMeditationById(
    _GetMeditationsByIdE event,
    Emitter<GetMeditationsByIdState> emit,
  ) async {
    emit(GetMeditationsByIdState.loading());

    final result = await _meditationsRepository.getMeditationsById(
      meditationId: event.meditationId,
    );
    result.fold(
      (failure) => emit(GetMeditationsByIdState.failure(failure)),
      (data) => emit(GetMeditationsByIdState.loading()),
    );
  }
}
