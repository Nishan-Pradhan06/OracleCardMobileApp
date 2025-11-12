part of 'grant_promo_code_bloc.dart';

@freezed
abstract class GrantPromoCodeEvent with _$GrantPromoCodeEvent {
  const factory GrantPromoCodeEvent.grantPromoCode(String promoCode, String userId) = _GrantPromoCodeE;
}