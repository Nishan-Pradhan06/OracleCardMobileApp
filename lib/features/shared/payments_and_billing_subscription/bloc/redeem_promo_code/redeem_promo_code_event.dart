part of 'redeem_promo_code_bloc.dart';

@freezed
abstract class RedeemPromoCodeEvent with _$RedeemPromoCodeEvent {
  const factory RedeemPromoCodeEvent.redeemPromoCode({
    required String redeemPromoCode,
  }) = _RedeemPromoCodeE;
}
