import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/user_and_billing/bloc/grant_promo_code/grant_promo_code_bloc.dart';

import '../../../../core/helpers/validation_helpers.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../auth/widgets/text_form_field.dart';

class GrantPromoDialog extends StatefulWidget {
  final int userId;
  const GrantPromoDialog({super.key, required this.userId});

  @override
  State<GrantPromoDialog> createState() => _GrantPromoDialogState();
}

class _GrantPromoDialogState extends State<GrantPromoDialog> {
  final _promoCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      insetPadding: const EdgeInsets.all(14),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: CustomPadding(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grant Promo Code',
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                CustomTextField(
                  label: 'Promo Code*',
                  hint: 'promo code',
                  type: CustomTextFieldType.text,
                  controller: _promoCodeController,
                  validator: InputValidator.validateRequired,
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 12),
                    BlocConsumer<GrantPromoCodeBloc, GrantPromoCodeState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loaded: (data) {
                            CustomToast.showSuccess(
                              'Promo granted successfully',
                            );
                            context.pop();
                          },
                          failure: (failure) {
                            CustomToast.showError(failure.message);
                          },
                        );
                      },
                      builder: (context, state) {
                        final bool isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return CustomButton(
                          text: 'Grant',
                          isDisabled: isLoading,
                          isLoading: isLoading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sl<GrantPromoCodeBloc>().add(
                                GrantPromoCodeEvent.grantPromoCode(
                                  _promoCodeController.text,
                                  widget.userId,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }
}
