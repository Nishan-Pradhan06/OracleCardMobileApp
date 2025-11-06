import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/create_deck/deck_bloc.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/model/deck_model.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';

import '../../../../core/widgets/custom_toast.dart';

class CreateDeckDialog extends StatefulWidget {
  const CreateDeckDialog({super.key});

  @override
  State<CreateDeckDialog> createState() => _CreateDeckDialogState();
}

class _CreateDeckDialogState extends State<CreateDeckDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isActive = true;

  @override
  Widget build(BuildContext context) {
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
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Create New Deck',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1a1a1a),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 22,
                        color: Color(0xFF666666),
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // Name Field
                CustomTextField(
                  label: 'New Deck *',
                  hint: 'Deck Name',
                  type: CustomTextFieldType.text,
                  controller: _nameController,
                  validator: InputValidator.validateRequired,
                ),

                const SizedBox(height: 20),
                // Description Field
                CustomTextField(
                  label: 'Description',
                  hint: 'Sample description',
                  type: CustomTextFieldType.email,
                  controller: _descriptionController,
                  maxLines: 4,
                ),
                const SizedBox(height: 24),

                // Active Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1a1a1a),
                      ),
                    ),
                    Switch(
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xFF6366F1),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF666666),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    BlocConsumer<DeckBloc, DeckState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loaded: (data) {
                            CustomToast.showSuccess(
                              'Deck Created Successfully !!!',
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
                          text: 'Save',
                          isDisabled: isLoading,
                          isLoading: isLoading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sl<DeckBloc>().add(
                                DeckEvent.createDeckCard(
                                  DeckCardModel(
                                    name: _nameController.text,
                                    description: _descriptionController.text,
                                    isActive: isActive,
                                  ),
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
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
