import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/journal/models/today_prompt_model.dart';

import '../models/jorunal_model.dart';

abstract interface class JournalRepository {
  //##-----GET TODAY PROMPT----------####
  FutureEither<PromptModel> getTodayPrompt();

  //##-----POST JOURNAL----------####
  FutureEither<String> postJournal({
    required JournalEntryModel journalEntryModel,
  });
}

class JournalRepositoryImpl implements JournalRepository {
  final ApiService _apiService;
  JournalRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  FutureEither<PromptModel> getTodayPrompt() async {
    final response = await _apiService.get('journal/prompt/today');

    return response.fold((failure) => Left(failure), (promptData) {
      final promptJson = promptData['data'];
      final prompt = PromptModel.fromMap(promptJson);
      return Right(prompt);
    });
  }

  //##-----------------POST JOURNAL------------------##
  @override
  FutureEither<String> postJournal({
    required JournalEntryModel journalEntryModel,
  }) async {
    final response = await _apiService.post<Map>(
      'journal',
      data: journalEntryModel.toMap(),
    );

    return response.fold((failure) => Left(failure), (data) {
      return Right('Journal saved successfully');
    });
  }
}
