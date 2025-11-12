import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';

class CreateMeditationsDialog extends StatefulWidget {
  const CreateMeditationsDialog({super.key});

  @override
  State<CreateMeditationsDialog> createState() =>
      _CreateMeditationsDialogState();
}

class _CreateMeditationsDialogState extends State<CreateMeditationsDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _visibilityController = TextEditingController(text: 'PREMIUM');

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
                      'Create New Meditations',
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
                  label: 'Title *',
                  hint: 'Morning Meditations',
                  type: CustomTextFieldType.text,
                  controller: _titleController,
                  validator: InputValidator.validateRequired,
                ),

                const SizedBox(height: 20),
                // Description Field
                CustomTextField(
                  label: 'Description',
                  hint: 'A calming sessions...',
                  type: CustomTextFieldType.text,
                  controller: _descriptionController,
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Audio',
                  leading: Icon(Icons.mic),
                  hint: 'Upload Audio',
                  type: CustomTextFieldType.email,
                  controller: _descriptionController,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Visibility *',
                  leading: Icon(Icons.mic),

                  dropdownItems: ['PREMIUM', 'FREE'],
                  type: CustomTextFieldType.dropdown,
                  validator: InputValidator.validateRequired,
                  onDropdownChanged: (s) {
                    _visibilityController.text = s!;
                  },
                  controller: _visibilityController,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Downloadable',
                      style: TextTheme.of(
                        context,
                      ).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
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
                // Active Toggle
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
                    CustomButton(
                      text: 'Save',
                      // isDisabled: isLoading,
                      // isLoading: isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log(_titleController.text);
                          log(_descriptionController.text);
                          log(_visibilityController.text);
                          log(isActive.toString());
                        }
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
    _titleController.dispose();
    _visibilityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
