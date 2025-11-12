part of 'grant_promo_code_bloc.dart';

@freezed
class GrantPromoCodeEvent with _$GrantPromoCodeEvent {
  const factory GrantPromoCodeEvent.started() = _Started;
}