part of 'create_sessions_bloc.dart';

@freezed
abstract class CreateSessionsEvent with _$CreateSessionsEvent {
  const factory CreateSessionsEvent.createSession(CreateSessionModel createSessonM) = _CreateSessionE;
}