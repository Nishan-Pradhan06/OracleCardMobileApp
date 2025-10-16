import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/features/users/notifications/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsBloc, GetNotificationsState>(
      builder: (context, state) {
        bool hasNotification = false;
        state.whenOrNull(
          loaded: (data) {
            hasNotification = data.items.isNotEmpty;
          },
        );
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
      },
    );
  }
}
