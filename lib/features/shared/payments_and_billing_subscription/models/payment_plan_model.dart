class BillingPlanModel {
  final int id;
  final String name;
  final String interval;
  final int priceCents;
  final String currency;
  final int freeTrialDays;
  final bool isActive;
  final String externalPriceId;

  BillingPlanModel({
    required this.id,
    required this.name,
    required this.interval,
    required this.priceCents,
    required this.currency,
    required this.freeTrialDays,
    required this.isActive,
    required this.externalPriceId,
  });

  factory BillingPlanModel.fromJson(Map<String, dynamic> json) {
    return BillingPlanModel(
      id: json['id'],
      name: json['name'],
      interval: json['interval'],
      priceCents: json['priceCents'],
      currency: json['currency'],
      freeTrialDays: json['freeTrialDays'],
      isActive: json['isActive'],
      externalPriceId: json['externalPriceId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'interval': interval,
      'priceCents': priceCents,
      'currency': currency,
      'freeTrialDays': freeTrialDays,
      'isActive': isActive,
      'externalPriceId': externalPriceId,
    };
  }
}
