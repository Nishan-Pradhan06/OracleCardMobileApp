import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/users/notifications/bloc/get_notifications/get_notifications_bloc.dart';
import 'package:oracle_card_app/features/users/notifications/models/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _unreadCount = 0;

  void _markAsRead(NotificationItemModel notification, NotificationModel data) {
    if (notification.openedAt == null) {
      setState(() {
        notification.openedAt = DateTime.now();
        _unreadCount = (_unreadCount - 1).clamp(0, data.items.length);
      });
    }
  }

  void _markAllAsRead(NotificationModel data) {
    setState(() {
      for (var notification in data.items) {
        notification.openedAt ??= DateTime.now();
      }
      _unreadCount = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day} ${_getMonth(dateTime.month)} ${dateTime.year}, ${_formatTimeOfDay(dateTime)}';
    }
  }

  String _getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  String _formatTimeOfDay(DateTime dateTime) {
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : (dateTime.hour == 0 ? 12 : dateTime.hour);
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'pm' : 'am';
    return '$hour:$minute $period';
  }

  bool _isUnread(NotificationItemModel notification) {
    return notification.openedAt == null;
  }

  @override
  void initState() {
    super.initState();
    // Fetch notifications initially
    sl<GetNotificationsBloc>().add(
      GetNotificationsEvent.getNotificationInbox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetNotificationsBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Notifications',
          titleAlignment: TitleAlignment.left,
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Color(0xFF6B48FF)),
              color: Colors.white,
              onSelected: (value) {
                if (value == 'mark_all_read') {
                  final state = context.read<GetNotificationsBloc>().state;
                  state.maybeWhen(
                    loaded: (data) => _markAllAsRead(data),
                    orElse: () {},
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'mark_all_read',
                  child: Row(
                    children: [
                      Icon(Icons.done_all, color: Colors.black87, size: 20),
                      SizedBox(width: 12),
                      Text(
                        'Mark all as read',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: CustomBackground(
          child: CustomRefreshIndicator(
            onRefresh: () async {
              sl<GetNotificationsBloc>().add(
                GetNotificationsEvent.getNotificationInbox(),
              );
            },
            child: BlocBuilder<GetNotificationsBloc, GetNotificationsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(height: 100),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  failure: (failure) => Center(
                    child: Text(
                      'Error: ${failure.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  loaded: (data) {
                    _unreadCount = data.items
                        .where((n) => n.openedAt == null)
                        .length;

                    if (data.items.isEmpty) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height:
                              MediaQuery.of(context).size.height -
                              kToolbarHeight,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'No notifications',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: data.items.length,
                      itemBuilder: (context, index) {
                        final notification = data.items[index];
                        final isUnread = _isUnread(notification);

                        return InkWell(
                          onTap: () => _markAsRead(notification, data),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF6B48FF,
                              ).withValues(alpha: isUnread ? 0.1 : 0),
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6B48FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: notification.type == 'PUSH'
                                        ? const Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        : const Text(
                                            'K',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              notification.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          if (isUnread)
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF6B48FF),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        notification.body,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                          height: 1.4,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        _formatTime(notification.sentAt),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
