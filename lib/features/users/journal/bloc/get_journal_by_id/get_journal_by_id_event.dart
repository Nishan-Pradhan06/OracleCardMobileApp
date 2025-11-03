part of 'get_journal_by_id_bloc.dart';

@freezed
abstract class GetJournalByIdEvent with _$GetJournalByIdEvent {
  const factory GetJournalByIdEvent.getJournalById({required int journalId}) =
      _GetJournalByIdE;
}
