import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/helpers/url_launcher_helper.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_toast.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import '../../../core/helpers/time_zone_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _timezoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    TimezoneHelper.setTimezone(_timezoneController);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _timezoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isFormValid = _formKey.currentState!.validate();
    final isCheckboxValid = InputValidator.validateCheckbox(isChecked) == null;

    if (!isCheckboxValid) {
      CustomToast.showWarning('Please accept the Terms of Services');
    }

    if (isFormValid && isCheckboxValid) {
      // Form + checkbox both valid
      log(_emailController.text);
      log(_passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomPadding(
          child: Center(
            child: SingleChildScrollView(
              child: CustomContainer(
                height: MediaQuery.sizeOf(context).height * 0.65,
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6B46C1),
                              ),
                        ),

                        CustomTextField(
                          label: 'Full Name',
                          controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          validator: InputValidator.validateName,
                        ),
                        CustomTextField(
                          label: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          type: CustomTextFieldType.email,
                          validator: InputValidator.validateEmail,
                        ),
                        CustomTextField(
                          label: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          type: CustomTextFieldType.password,
                          validator: InputValidator.validatePassword,
                        ),
                        CustomTextField(
                          label: 'Timezone',
                          readOnly: true,
                          enabled: false,
                          controller: _timezoneController,
                          keyboardType: TextInputType.datetime,
                          type: CustomTextFieldType.text,
                        ),

                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF6B46C1),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),

                            RichText(
                              text: TextSpan(
                                text: 'I accept the ',
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(
                                    text: 'Terms of Services',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6B46C1),
                                        ),

                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        urlLauncher(termAndServices);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          width: double.infinity,
                          text: 'Sign Up',
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
