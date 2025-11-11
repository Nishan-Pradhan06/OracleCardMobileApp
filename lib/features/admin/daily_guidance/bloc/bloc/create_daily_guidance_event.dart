part of 'create_daily_guidance_bloc.dart';

@freezed
abstract class CreateDailyGuidanceEvent with _$CreateDailyGuidanceEvent {
  const factory CreateDailyGuidanceEvent.createDailyGuidance(
    AdminDailyGuidanceModel adminDailyGuidanceM,
  ) = _CreateDailyGuidanceE;
}
