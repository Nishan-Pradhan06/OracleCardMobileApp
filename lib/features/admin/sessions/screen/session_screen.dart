import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/sessions/bloc/bloc/create_sessions_bloc.dart';

import '../../../../core/helpers/time_zone_helper.dart';
import '../../../../core/helpers/validation_helpers.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../auth/widgets/text_form_field.dart';
import '../models/create_sessions_model.dart';

class CreateSessionDialog extends StatefulWidget {
  const CreateSessionDialog({super.key});

  @override
  State<CreateSessionDialog> createState() => _CreateSessionDialogState();
}

class _CreateSessionDialogState extends State<CreateSessionDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _timezoneController = TextEditingController();
  final _zoomUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late DateTime startDate;
  late TimeOfDay startTime;

  late DateTime endDate;
  late TimeOfDay endTime;

  bool premiumOnly = false;

  @override
  void initState() {
    super.initState();

    /// DEFAULT VALUES → Current date/time
    final now = DateTime.now();

    startDate = now;
    startTime = TimeOfDay(hour: now.hour, minute: now.minute);

    endDate = now;
    endTime = TimeOfDay(
      hour: now.add(const Duration(hours: 1)).hour,
      minute: now.minute,
    );

    /// Detect current timezone
    TimezoneHelper.setTimezone(_timezoneController);
  }

  Future<void> selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  Future<void> selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? startTime : endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
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
        child: Form(
          key: _formKey,
          child: CustomPadding(
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ------------------ HEADER ------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create New Session',
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),

                /// ------------------ TEXT FIELDS ------------------
                CustomTextField(
                  label: 'Title *',
                  hint: 'Daily Insight',
                  type: CustomTextFieldType.text,
                  controller: _titleController,
                  validator: InputValidator.validateRequired,
                ),
                CustomTextField(
                  label: 'Description',
                  hint: 'A guided session',
                  type: CustomTextFieldType.text,
                  controller: _descriptionController,
                  maxLines: 4,
                ),
                CustomTextField(
                  label: 'Zoom Url',
                  hint: 'https://',
                  type: CustomTextFieldType.text,
                  controller: _zoomUrlController,
                  maxLines: 2,
                ),
                CustomTextField(
                  label: 'Timezone',
                  readOnly: true,
                  enabled: false,
                  controller: _timezoneController,
                  keyboardType: TextInputType.datetime,
                  type: CustomTextFieldType.text,
                ),

                /// ------------------ START DATE/TIME ------------------
                Text(
                  'Start',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => selectDate(context, true),
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
                            formatDate(startDate),
                            style: textTheme.bodyMedium?.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () => selectTime(context, true),
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
                            formatTime(startTime),
                            style: textTheme.bodyMedium?.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// ------------------ END DATE/TIME ------------------
                Text(
                  'End *',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => selectDate(context, false),
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
                            formatDate(endDate),
                            style: textTheme.bodyMedium?.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: InkWell(
                        onTap: () => selectTime(context, false),
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
                            formatTime(endTime),
                            style: textTheme.bodyMedium?.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// ------------------ PREMIUM CHECKBOX ------------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Only',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: Checkbox(
                        value: premiumOnly,
                        onChanged: (value) {
                          setState(() {
                            premiumOnly = value ?? false;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),

                /// ------------------ ACTION BUTTONS ------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 14),

                    BlocConsumer<CreateSessionsBloc, CreateSessionsState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          loaded: (data) {
                            CustomToast.showSuccess(
                              'Session Created Successfully!',
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
                              final DateTime fullStart = DateTime(
                                startDate.year,
                                startDate.month,
                                startDate.day,
                                startTime.hour,
                                startTime.minute,
                              );

                              final DateTime fullEnd = DateTime(
                                endDate.year,
                                endDate.month,
                                endDate.day,
                                endTime.hour,
                                endTime.minute,
                              );

                              sl<CreateSessionsBloc>().add(
                                CreateSessionsEvent.createSession(
                                  CreateSessionModel(
                                    title: _titleController.text.trim(),
                                    description: _descriptionController.text
                                        .trim(),
                                    timezone: _timezoneController.text.trim(),
                                    isPremiumOnly: premiumOnly,
                                    startTime: fullStart,
                                    endTime: fullEnd,
                                    zoomUrl: _zoomUrlController.text.trim(),
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
    _titleController.dispose();
    _descriptionController.dispose();
    _timezoneController.dispose();
    _zoomUrlController.dispose();
    super.dispose();
  }
}
