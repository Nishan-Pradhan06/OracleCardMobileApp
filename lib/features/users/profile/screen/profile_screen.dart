import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_button.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/helpers/validation_helpers.dart';
import '../../../../core/widgets/cusotm_switch.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../auth/widgets/text_form_field.dart';
import '../../home/widgets/notification_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final _timezoneController = TextEditingController();

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        titleAlignment: TitleAlignment.left,
        actions: [
          NotificationIcon(hasNotification: true),
          CustomChip(label: 'Premium', type: ChipType.premium),
        ],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
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
                          // controller: ,
                          trailing: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/edit.svg'),
                          ),
                          type: CustomTextFieldType.text,
                          validator: InputValidator.validateName,
                        ),
                        CustomTextField(
                          label: 'Email',
                          readOnly: true,
                          trailing: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/lock.svg'),
                          ),
                          type: CustomTextFieldType.text,
                          validator: InputValidator.validateEmail,
                        ),
                        CustomTextField(
                          label: 'Timezone',
                          // controller: _timezoneController,
                          // keyboardType: TextInputType.datetime,
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
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Push Notifications',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            CustomSwitch(
                              value: isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  isSwitched = val;
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
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Plan',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Text(
                                  ' Free',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                ),
                              ],
                            ),
                            CustomButton(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFF7E5F), Color(0xFFFFB347)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              leadingIcon: SvgPicture.asset(
                                'assets/icons/king.svg',
                              ),
                              text: 'Upgrade to Premium',
                              onPressed: () {
                                context.pushNamed(AppRoutesName.billingDetailsScreen);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
