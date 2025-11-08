part of 'create_meditations_bloc.dart';

@freezed
abstract class CreateMeditationsEvent with _$CreateMeditationsEvent {
  const factory CreateMeditationsEvent.createMeditations(CreateMeditationsModel createMeditationM) = _CreateMeditationE;
}