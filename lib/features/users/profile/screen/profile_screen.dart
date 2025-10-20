import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/custom_toast.dart';
import 'package:oracle_card_app/features/auth/blocs/sign_out/sign_out_bloc.dart';
import 'package:oracle_card_app/features/users/profile/bloc/user_profile_bloc.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/helpers/validation_helpers.dart';
import '../../../../core/widgets/cusotm_switch.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../../auth/widgets/text_form_field.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/profile_simmer_loader.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _timezoneController = TextEditingController(text: "GMT+5:45");

  bool isSwitchedPushNotification = true;
  bool isEditField = false;
  bool isAllReadyAssigned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        titleAlignment: TitleAlignment.left,
        automaticallyImplyLeading: false,
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<UserProfileBloc>().add(UserProfileEvent.getUserProfile());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: BlocBuilder<UserProfileBloc, UserProfileState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox(height: 100),
                    loading: () => const SizedBox(
                      height: 100,
                      child: ProfileSkeletonLoader(),
                    ),
                    failure: (failure) => SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Error: ${failure.message}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    loaded: (profileData) {
                      if (isAllReadyAssigned == false) {
                        isSwitchedPushNotification = profileData.pushEnabled;
                        isAllReadyAssigned = true;
                      }
                      _nameController.text = profileData.user.name ?? '';
                      _emailController.text = profileData.user.email;
                      _timezoneController.text = profileData.timezone ?? '';

                      return Column(
                        spacing: 20,
                        children: [
                          ProfileAvatar(
                            imagePath:
                                'https://avatars.githubusercontent.com/u/105001135?v=4',
                            userName: 'My Profile',
                            onCameraTap: () {},
                          ),

                          CustomContainer(
                            useIntrinsicHeight: true,
                            child: Column(
                              spacing: 10,
                              children: [
                                CustomTextField(
                                  label: 'Name',
                                  controller: _nameController,
                                  readOnly: !isEditField,
                                  borderColor: Color(0xFFE0E0E0),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditField = !isEditField;
                                      });
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/icons/edit.svg',
                                    ),
                                  ),
                                  type: CustomTextFieldType.text,
                                  validator: InputValidator.validateName,
                                ),
                                CustomTextField(
                                  label: 'Email',
                                  controller: _emailController,
                                  readOnly: true,
                                  enabled: false,
                                  borderColor: Color(0xFFE0E0E0),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/lock.svg',
                                    ),
                                  ),
                                  type: CustomTextFieldType.text,
                                  validator: InputValidator.validateEmail,
                                ),
                                CustomTextField(
                                  label: 'Timezone',
                                  controller: _timezoneController,
                                  borderColor: Color(0xFFE0E0E0),
                                  type: CustomTextFieldType.text,
                                ),
                              ],
                            ),
                          ),

                          CustomContainer(
                            useIntrinsicHeight: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preferences',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Push Notifications',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    CustomSwitch(
                                      value: isSwitchedPushNotification,
                                      onChanged: (val) {
                                        setState(() {
                                          isSwitchedPushNotification = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomContainer(
                            useIntrinsicHeight: true,
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'Billing',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Current Plan',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          profileData.user.plan,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                        ),
                                      ],
                                    ),

                                    CustomButton(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFF7E5F),
                                          Color(0xFFFFB347),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      leadingIcon: SvgPicture.asset(
                                        'assets/icons/king.svg',
                                      ),
                                      text: 'Upgrade to Premium',
                                      onPressed:
                                          // profileData.user.plan == 'FREE'?
                                          () {
                                            context.pushNamed(
                                              AppRoutesName
                                                  .billingDetailsScreen,
                                            );
                                          },
                                      // : null,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          BlocConsumer<SignOutBloc, SignOutState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                loaded: (data) {
                                  context.goNamed(
                                    AppRoutesName.loginScreenRoute,
                                  );
                                  CustomToast.showSuccess(
                                    'Signout Successfully!!!',
                                  );
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
                                isDisabled: isLoading,
                                text: 'SignOut',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        sl<SignOutBloc>().add(
                                          SignOutEvent.signOut(),
                                        );
                                      },
                                leadingIcon: Icon(
                                  Icons.exit_to_app_outlined,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
