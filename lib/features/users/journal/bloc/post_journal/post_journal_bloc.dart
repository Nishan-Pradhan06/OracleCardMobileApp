import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';

import '../../models/jorunal_model.dart';
import '../../repository/journal_repository.dart';

part 'post_journal_event.dart';
part 'post_journal_state.dart';
part 'post_journal_bloc.freezed.dart';

class PostJournalBloc extends Bloc<PostJournalEvent, PostJournalState> {
  final JournalRepository _journalRepository;

  PostJournalBloc({required JournalRepository repo})
    : _journalRepository = repo,
      super(PostJournalState.initial()) {
    on<_PostJournalE>(_onPostJournalEntry);
  }

  Future<void> _onPostJournalEntry(
    _PostJournalE event,
    Emitter<PostJournalState> emit,
  ) async {
    emit(PostJournalState.loading());

    await Future.delayed(Duration(seconds: 3));

    final result = await _journalRepository.postJournal(
      journalEntryModel: event.journalEntryModel,
    );

    result.fold(
      (failure) => emit(PostJournalState.failure(failure)),
      (data) => emit(PostJournalState.loaded(data)),
    );
  }
}
