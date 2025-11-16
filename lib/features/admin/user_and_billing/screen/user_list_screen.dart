import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

import '../../../../core/widgets/admin_appbar.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(
        title: 'Daily Guidance',
        automaticallyImplyLeading: true,
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                CustomContainer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Alex Jhonson'),
                              Text('alex.johnson@example.com'),
                            ],
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

                      Text('Subscription status'),

                      Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF10B981).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Text(
                            'Active',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: Color(0xFF10B981),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text('Subscription status'),
                      Text('Sep 20, 2025, 08:00 AM +0545'),

                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/style.svg'),
                              Text('Pull'),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/book.svg'),
                              Text('Journals'),
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
    );
  }
}
