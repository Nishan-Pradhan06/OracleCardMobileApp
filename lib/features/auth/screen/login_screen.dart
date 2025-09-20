import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomPadding(
          child: Center(
            child: CustomContainer(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B46C1),
                            ),
                      ),

                      CustomTextField(
                        label: 'Email',
                        type: CustomTextFieldType.email,
                        validator: InputValidator.validateEmail,
                      ),
                      CustomTextField(
                        label: 'Password',
                        obscureText: true,
                        type: CustomTextFieldType.password,
                        validator: InputValidator.validatePassword,
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
    );
  }
}
