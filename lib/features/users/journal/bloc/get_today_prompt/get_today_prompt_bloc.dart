import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oracle_card_app/core/state/bloc_base_state.dart';
import 'package:oracle_card_app/features/users/journal/models/today_prompt_model.dart';
import 'package:oracle_card_app/features/users/journal/repository/journal_repository.dart';

part 'get_today_prompt_event.dart';
part 'get_today_prompt_state.dart';
part 'get_today_prompt_bloc.freezed.dart';

class GetTodayPromptBloc
    extends Bloc<GetTodayPromptEvent, GetTodayPromptState> {
  final JournalRepository _journalRepository;

  GetTodayPromptBloc({required JournalRepository repo})
    : _journalRepository = repo,
      super(GetTodayPromptState.initial()) {
    on<_GetTodayPromptE>(_onGetTodayPrompt);
  }

  Future<void> _onGetTodayPrompt(
    _GetTodayPromptE event,
    Emitter<GetTodayPromptState> emit,
  ) async {
    emit(GetTodayPromptState.loading());
    await Future.delayed(Duration(seconds: 10));
    final result = await _journalRepository.getTodayPrompt();
    result.fold(
      (failure) => emit(GetTodayPromptState.failure(failure)),
      (promptData) => emit(GetTodayPromptState.loaded(promptData)),
    );
  }
}
