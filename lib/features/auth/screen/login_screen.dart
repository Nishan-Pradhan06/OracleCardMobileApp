import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/helpers/validation_helpers.dart';
import 'package:oracle_card_app/core/widgets/custom_account_check_text.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_toast.dart';
import 'package:oracle_card_app/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:oracle_card_app/features/auth/models/sign_in_model.dart';
import 'package:oracle_card_app/features/auth/widgets/text_form_field.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';

import '../../../core/di/dependency_injection.dart';

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
                        controller: _emailController,
                        validator: InputValidator.validateEmail,
                      ),
                      CustomTextField(
                        label: 'Password',
                        obscureText: true,
                        controller: _passwordController,
                        type: CustomTextFieldType.password,
                        validator: InputValidator.validatePassword,
                      ),

                      BlocConsumer<UserSignInBloc, UserSignInState>(
                        listener: (context, state) {
                          state.whenOrNull(
                            loaded: (data) {
                              // context.read<>();
                              if (data == 'USER') {
                                context.goNamed(
                                  AppRoutesName.userBottomNavBarRoute,
                                );
                              } else if (data == 'ADMIN') {
                                context.goNamed(
                                  AppRoutesName.adminDashboardRoute,
                                );
                              }
                              CustomToast.showSuccess("Login Successful");
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
                            isLoading: isLoading,
                            width: double.infinity,
                            text: 'Login',
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      log(_emailController.text);
                                      log(_passwordController.text);
                                      sl<UserSignInBloc>().add(
                                        UserSignInEvent.userSignIn(
                                          SignInModel(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                          );
                        },
                      ),
                      AccountCheckText(
                        message: 'Don\'t have account ?',
                        actionText: 'Sign Up',
                        onTap: () {
                          context.pushNamed(AppRoutesName.signUpScreenRoute);
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
