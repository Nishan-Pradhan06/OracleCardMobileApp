import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/bloc/create_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/model/admin_daily_guidance_model.dart';

import '../../../../core/helpers/validation_helpers.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../auth/widgets/text_form_field.dart';

class CreateDailyGuidanceDialog extends StatefulWidget {
  const CreateDailyGuidanceDialog({super.key});

  @override
  State<CreateDailyGuidanceDialog> createState() =>
      _CreateDailyGuidanceDialogState();
}

class _CreateDailyGuidanceDialogState extends State<CreateDailyGuidanceDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _visibilityController = TextEditingController(text: 'PREMIUM');
  final _formKey = GlobalKey<FormState>();

  File? _audioFile;

  DateTime? scheduleDate;
  TimeOfDay? startTime;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        scheduleDate = picked;
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        startTime = picked;
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

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
                      'Create New Guidance',
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
                  label: 'Title *',
                  hint: 'Daily Insight',
                  type: CustomTextFieldType.text,
                  controller: _titleController,
                  validator: InputValidator.validateRequired,
                ),

                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Description',
                  hint: 'Sample guidance message',
                  type: CustomTextFieldType.email,
                  controller: _descriptionController,
                  maxLines: 4,
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Audio',
                  leading: const Icon(Icons.mic),
                  hint: 'Upload Audio',
                  onPickedAudio: (File audioFile) {
                    setState(() {
                      _audioFile = audioFile;
                    });
                  },
                  type: CustomTextFieldType.audio,
                ),

                const SizedBox(height: 20),
                Text(
                  'Schedule',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => selectDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            suffixIcon: const Icon(
                              Icons.calendar_today,
                              size: 18,
                            ),
                          ),
                          child: Text(
                            scheduleDate != null
                                ? formatDate(scheduleDate!)
                                : 'Select Date',
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              color: scheduleDate != null
                                  ? Colors.black
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () => selectTime(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            suffixIcon: const Icon(Icons.access_time, size: 18),
                          ),
                          child: Text(
                            startTime != null
                                ? formatTime(startTime!)
                                : 'Select Time',
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              color: startTime != null
                                  ? Colors.black
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.info, size: 10, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      'Leave empty to publish immediately',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Visibility *',
                  leading: const Icon(Icons.visibility),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 12),
                    BlocConsumer<
                      CreateDailyGuidanceBloc,
                      CreateDailyGuidanceState
                    >(
                      listener: (context, state) {
                        state.whenOrNull(
                          loaded: (data) {
                            CustomToast.showSuccess(
                              'Guidance Created Successfully !!!',
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
                              sl<CreateDailyGuidanceBloc>().add(
                                CreateDailyGuidanceEvent.createDailyGuidance(
                                  AdminDailyGuidanceModel(
                                    title: _titleController.text,
                                    message: _descriptionController.text,
                                    audioUrl: _audioFile!,
                                    visibility: _visibilityController.text,
                                  ),
                                ),
                              );
                              log(_titleController.text);
                              log(_descriptionController.text);
                              if (_audioFile != null) log(_audioFile!.path);
                              log(
                                scheduleDate?.toString() ?? 'No Date Selected',
                              );
                              log(startTime?.toString() ?? 'No Time Selected');
                              log(_visibilityController.text);
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
    _descriptionController.dispose();
    _visibilityController.dispose();
    super.dispose();
  }
}
