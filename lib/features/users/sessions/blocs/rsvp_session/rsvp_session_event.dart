part of 'rsvp_session_bloc.dart';

@freezed
abstract class RsvpSessionEvent with _$RsvpSessionEvent {
  const factory RsvpSessionEvent.rsvpSession(int id) = _RsvpSessionE;
}