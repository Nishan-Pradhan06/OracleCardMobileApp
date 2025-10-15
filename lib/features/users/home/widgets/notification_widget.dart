import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';

class NotificationIcon extends StatelessWidget {
  final bool hasNotification;

  const NotificationIcon({super.key, this.hasNotification = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/svg/notification.svg'),
          onPressed: () {
            context.pushNamed(AppRoutesName.notificationScreenAppRoute);
          },
        ),
        if (hasNotification)
          Positioned(
            right: 10,
            top: 10,
            child: SvgPicture.asset(
              'assets/svg/notification_dot.svg',
              width: 10,
              height: 10,
            ),
          ),
      ],
    );
  }
}
