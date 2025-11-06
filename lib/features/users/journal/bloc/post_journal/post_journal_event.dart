part of 'post_journal_bloc.dart';

@freezed
abstract class PostJournalEvent with _$PostJournalEvent {
  const factory PostJournalEvent.postJournal(JournalEntryModel journalEntryModel) = _PostJournalE;
}