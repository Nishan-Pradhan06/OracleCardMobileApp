import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/helpers/textfield_validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
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
                            // Checkbox(value: , onChanged: ),
                            Expanded(
                              child: Text('I accept the Terms of Services'),
                            ),
                          ],
                        ),
                        CustomButton(
                          width: double.infinity,
                          text: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              log(_emailController.text);
                              log(_passwordController.text);
                            }
                          },
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
