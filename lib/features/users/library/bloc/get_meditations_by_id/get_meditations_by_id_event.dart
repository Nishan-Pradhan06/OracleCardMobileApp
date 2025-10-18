part of 'get_meditations_by_id_bloc.dart';

@freezed
abstract class GetMeditationsByIdEvent with _$GetMeditationsByIdEvent {
  const factory GetMeditationsByIdEvent.getMeditationsById({required int meditationId}) = _GetMeditationsByIdE;
}