import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/meditations/bloc/bloc/create_meditations_bloc.dart';
import 'package:oracle_card_app/features/admin/meditations/model/create_meditations_model.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';

import '../../../../core/widgets/custom_toast.dart';

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
  File? _audioFile;

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

                  onPickedAudio: (File audioFile) {
                    setState(() {
                      _audioFile = audioFile;
                    });
                  },
                  type: CustomTextFieldType.audio,
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
                    BlocConsumer<CreateMeditationsBloc, CreateMeditationsState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loaded: (data) {
                            CustomToast.showSuccess(
                              'New Meditations Created Successfully !!!',
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
                              sl<CreateMeditationsBloc>().add(
                                CreateMeditationsEvent.createMeditations(
                                  CreateMeditationsModel(
                                    title: _titleController.text,
                                    description: _descriptionController.text,
                                    audioFile: _audioFile!,
                                    visibility: _visibilityController.text,
                                    isDownloadable: isActive,
                                  ),
                                ),
                              );
                              log(_titleController.text);
                              log(_descriptionController.text);
                              log(_descriptionController.text);
                              log(_audioFile!.path.toString());
                              log(isActive.toString());
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
    _titleController.dispose();
    _visibilityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
