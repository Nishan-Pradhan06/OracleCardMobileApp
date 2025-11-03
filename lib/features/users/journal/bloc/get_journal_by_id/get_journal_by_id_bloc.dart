import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/journal/models/entries_list_model.dart';
import 'package:oracle_card_app/features/users/journal/repository/journal_repository.dart';

part 'get_journal_by_id_event.dart';
part 'get_journal_by_id_state.dart';
part 'get_journal_by_id_bloc.freezed.dart';

class GetJournalByIdBloc
    extends Bloc<GetJournalByIdEvent, GetJournalByIdState> {
  final JournalRepository _journalRepository;

  GetJournalByIdBloc({required JournalRepository repo})
    : _journalRepository = repo,
      super(GetJournalByIdState.initial()) {
    on<_GetJournalByIdE>(_onGetJournalById);
  }

  Future<void> _onGetJournalById(
    _GetJournalByIdE event,
    Emitter<GetJournalByIdState> emit,
  ) async {
    emit(GetJournalByIdState.loading());

    await Future.delayed(Duration(seconds: 3));

    final result = await _journalRepository.getJournalById(
      journalId: event.journalId,
    );

    result.fold(
      (failure) => emit(GetJournalByIdState.failure(failure)),
      (data) => emit(GetJournalByIdState.loaded(data)),
    );
  }
}
