part of 'get_journal_by_id_bloc.dart';

@freezed
class GetJournalByIdEvent with _$GetJournalByIdEvent {
  const factory GetJournalByIdEvent.started() = _Started;
}