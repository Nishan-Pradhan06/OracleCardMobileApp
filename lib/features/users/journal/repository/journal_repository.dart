import 'package:dartz/dartz.dart';
import 'package:oracle_card_app/common/typedef/either_type.dart';
import 'package:oracle_card_app/core/network/api_services.dart';
import 'package:oracle_card_app/features/users/journal/models/entries_list_model.dart';
import 'package:oracle_card_app/features/users/journal/models/today_prompt_model.dart';

import '../models/jorunal_model.dart';

abstract interface class JournalRepository {
  //##-----GET TODAY PROMPT----------####
  FutureEither<TodayPromptModel> getTodayPrompt();

  //##-----GET MY JOURNAL ENTRIES----------####
  FutureEither<JournalDataModel> getMyJournalEntires();

  //##-----POST JOURNAL----------####
  FutureEither<String> postJournal({
    required JournalEntryModel journalEntryModel,
  });
  //##-----GET JOURNAL BY ID----------####
  FutureEither<JournalEntryListModel> getJournalById({required int journalId});
}

class JournalRepositoryImpl implements JournalRepository {
  final ApiService _apiService;
  JournalRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-----GET MY TODAY PROMPT----------####
  @override
  FutureEither<TodayPromptModel> getTodayPrompt() async {
    final response = await _apiService.get('journal/prompt/today');

    return response.fold((failure) => Left(failure), (promptData) {
      final promptJson = promptData['data']['prompt'];
      final prompt = TodayPromptModel.fromJson(promptJson);
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

  //##-----GET MY JOURNAL ENTRIES----------####
  @override
  FutureEither<JournalDataModel> getMyJournalEntires() async {
    final response = await _apiService.get('journal');

    return response.fold((failure) => Left(failure), (data) {
      final journalEntiresJson = data['data'];
      final journalEntires = JournalDataModel.fromJson(journalEntiresJson);
      return Right(journalEntires);
    });
  }

  //##-----GET MY JOURNAL BY ID----------####

  @override
  FutureEither<JournalEntryListModel> getJournalById({
    required int journalId,
  }) async {
    final response = await _apiService.get('journal/$journalId');

    return response.fold((failure) => Left(failure), (data) {
      final journalJson = data['data'];
      final journalData = JournalEntryListModel.fromJson(journalJson);
      return Right(journalData);
    });
  }
}
