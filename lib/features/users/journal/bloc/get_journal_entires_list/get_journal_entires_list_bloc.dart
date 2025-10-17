import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/journal/models/entries_list_model.dart';
import 'package:oracle_card_app/features/users/journal/repository/journal_repository.dart';

part 'get_journal_entires_list_event.dart';
part 'get_journal_entires_list_state.dart';
part 'get_journal_entires_list_bloc.freezed.dart';

class GetJournalEntiresListBloc
    extends Bloc<GetJournalEntiresListEvent, GetJournalEntiresListState> {
  final JournalRepository _journalRepository;
  GetJournalEntiresListBloc({required JournalRepository repo})
    : _journalRepository = repo,
      super(GetJournalEntiresListState.initial()) {
    on<_GetJournalEntiresListE>(_onGetJournalEntiresList);
  }

  Future<void> _onGetJournalEntiresList(
    _GetJournalEntiresListE event,
    Emitter<GetJournalEntiresListState> emit,
  ) async {
    emit(GetJournalEntiresListState.loading());
    await Future.delayed(Duration(seconds: 3));

    final result = await _journalRepository.getMyJournalEntires();

    result.fold(
      (failure) => emit(GetJournalEntiresListState.failure(failure)),
      (data) => emit(GetJournalEntiresListState.loaded(data)),
    );
  }
}
