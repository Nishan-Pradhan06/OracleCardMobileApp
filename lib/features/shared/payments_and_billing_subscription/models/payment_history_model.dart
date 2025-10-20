
class PaymentHistoryDataModel {
  final List<PaymentItem> items;
  final String? nextCursor;

  PaymentHistoryDataModel({required this.items, this.nextCursor});

  factory PaymentHistoryDataModel.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryDataModel(
      items: (json['items'] as List<dynamic>)
          .map((item) => PaymentItem.fromJson(item))
          .toList(),
      nextCursor: json['nextCursor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'nextCursor': nextCursor,
    };
  }
}

class PaymentItem {
  final int id;
  final int userId;
  final int planId;
  final String provider;
  final String status;
  final int amountCents;
  final String currency;
  final String? razorpayOrderId;
  final String? razorpayPaymentId;
  final String? razorpaySignature;
  final DateTime createdAt;

  PaymentItem({
    required this.id,
    required this.userId,
    required this.planId,
    required this.provider,
    required this.status,
    required this.amountCents,
    required this.currency,
    this.razorpayOrderId,
    this.razorpayPaymentId,
    this.razorpaySignature,
    required this.createdAt,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      id: json['id'],
      userId: json['userId'],
      planId: json['planId'],
      provider: json['provider'],
      status: json['status'],
      amountCents: json['amountCents'],
      currency: json['currency'],
      razorpayOrderId: json['razorpayOrderId'],
      razorpayPaymentId: json['razorpayPaymentId'],
      razorpaySignature: json['razorpaySignature'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'planId': planId,
      'provider': provider,
      'status': status,
      'amountCents': amountCents,
      'currency': currency,
      'razorpayOrderId': razorpayOrderId,
      'razorpayPaymentId': razorpayPaymentId,
      'razorpaySignature': razorpaySignature,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
