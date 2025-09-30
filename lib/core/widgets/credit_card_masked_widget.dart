import 'package:flutter/material.dart';

class CreditCardMasked extends StatelessWidget {
  final String cardNumber;
  final String? cardHolder;
  final String? expiry;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? numberStyle;
  final TextStyle? metaStyle;

  const CreditCardMasked({
    super.key,
    required this.cardNumber,
    this.cardHolder,
    this.expiry,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.all(16.0),
    this.numberStyle,
    this.metaStyle,
  });

  String _onlyDigits(String s) => s.replaceAll(RegExp(r'[^0-9]'), '');

  String _maskedDisplay(String digits) {
    if (digits.isEmpty) return '';

    final len = digits.length;
    final last = len <= 4 ? digits : digits.substring(len - 4);

    final groups = ((len - 4) / 4).ceil().clamp(0, 3).toInt();
    final bulletGroups = List.generate(groups, (_) => '••••').join(' ');

    return [if (bulletGroups.isNotEmpty) bulletGroups, last].join(' ').trim();
  }

  String? _detectBrand(String digits) {
    if (digits.startsWith('4')) return 'VISA';
    if (digits.startsWith('5')) return 'MASTERCARD';
    if (digits.startsWith('34') || digits.startsWith('37')) return 'AMEX';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final digits = _onlyDigits(cardNumber);
    final masked = _maskedDisplay(digits);
    final brand = _detectBrand(digits);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (brand != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              brand,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                masked,
                style:
                    numberStyle ??
                    Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(letterSpacing: 2.0),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (cardHolder != null)
                    Expanded(
                      child: Text(
                        cardHolder!.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style:
                            metaStyle ?? Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  if (expiry != null)
                    Text(
                      expiry!,
                      style: metaStyle ?? Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
