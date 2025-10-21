import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../dashboard/widgets/custom_btn_ad.dart';

class AdminDailyGuidanceScreen extends StatelessWidget {
  const AdminDailyGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Daily Guidance'),

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
                    btnText: 'Create Guidance',
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
                              'Morning Inshight',
                              style: TextTheme.of(context).headlineLarge
                                  ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Container(
                              height: 20,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Live',
                                  style: TextTheme.of(context).bodySmall
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            InkWell(
                              splashColor: Color(0xFF8B5CF6),
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(color: Color(0xFF8B5CF6)),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Meterics',
                                    style: TextTheme.of(context).bodySmall
                                        ?.copyWith(
                                          color: Color(0xFF8B5CF6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
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
