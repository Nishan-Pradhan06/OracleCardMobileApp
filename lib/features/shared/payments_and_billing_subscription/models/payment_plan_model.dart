class PaymentPlanModel {
  final int id;
  final String name;
  final String interval;
  final int priceCents;
  final String currency;
  final int freeTrialDays;
  final bool isActive;

  PaymentPlanModel({
    required this.id,
    required this.name,
    required this.interval,
    required this.priceCents,
    required this.currency,
    required this.freeTrialDays,
    required this.isActive,
  });

  double get price => priceCents / 100;
  
  double get monthlyPrice {
    if (interval == 'MONTH') return price;
    return price / 12;
  }
}