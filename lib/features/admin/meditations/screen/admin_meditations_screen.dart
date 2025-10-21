import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/admin/dashboard/widgets/custom_btn_ad.dart';
import '../../../../core/widgets/admin_appbar.dart';

class AdminMeditationsScreen extends StatelessWidget {
  const AdminMeditationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Meditations'),

      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  CustomBtnAdmin(
                    btnText: 'Add Meditation',
                    onPressed: () {},
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  CustomContainer(
                    useIntrinsicHeight: true,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Column(
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Morning Meditation',
                              style: TextTheme.of(context).headlineLarge
                                  ?.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF8B5CF6).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Premium',
                                  style: TextTheme.of(context).bodyMedium
                                      ?.copyWith(
                                        color: Color(0xFF8B5CF6),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/schedule.svg'),
                                SizedBox(width: 4),
                                Text(
                                  'Sep 13, 2025, 08:00 AM +0545',
                                  style: TextTheme.of(context).bodyLarge
                                      ?.copyWith(color: Color(0xFF6B7280)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Icon(
                                  Icons.timer,
                                  size: 16,
                                  color: Color(0xFF6B7280),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '45 mins',
                                  style: TextTheme.of(context).bodyLarge
                                      ?.copyWith(color: Color(0xFF6B7280)),
                                ),
                              ],
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
