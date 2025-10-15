import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_appbar.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _unreadCount = 1;

  // Mock data matching the API response
  final List<Map<String, dynamic>> _notifications = [
    {
      "id": 9101,
      "type": "INAPP",
      "title": "Welcome to Premium",
      "body": "Your features are unlocked.",
      "sentAt": "2025-10-12T04:10:00Z",
      "openedAt": null,
    },
    {
      "id": 9100,
      "type": "PUSH",
      "title": "Today's Guidance",
      "body": "Tap to read today's message.",
      "sentAt": "2025-10-12T03:00:00Z",
      "openedAt": "2025-10-12T03:05:10Z",
    },
    {
      "id": 9099,
      "type": "INAPP",
      "title": "Benefits Calling you! 😍",
      "body":
          "Grab the benefits of Suraksha Mini with upgrade to Khalti Suraksha 💰 Upto Rs. 2,30,000 insurance coverage 🛡️ Upto Rs. 1,50,000 health care benefits",
      "sentAt": "2025-01-24T11:46:00Z",
      "openedAt": null,
    },
  ];
  

  void _markAsRead(int index) {
    if (_notifications[index]['openedAt'] == null) {
      setState(() {
        _notifications[index]['openedAt'] = DateTime.now().toIso8601String();
        _unreadCount = (_unreadCount - 1).clamp(0, _notifications.length);
      });
    }
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        if (notification['openedAt'] == null) {
          notification['openedAt'] = DateTime.now().toIso8601String();
        }
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

  String _formatTime(String timestamp) {
    final dateTime = DateTime.parse(timestamp);
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

  bool _isUnread(Map<String, dynamic> notification) {
    return notification['openedAt'] == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        titleAlignment: TitleAlignment.left,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Color(0xFF6B48FF)),
            color: Colors.white,
            onSelected: (value) {
              if (value == 'mark_all_read') {
                _markAllAsRead();
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
          onRefresh: () async {},
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              final isUnread = _isUnread(notification);

              return InkWell(
                onTap: () => _markAsRead(index),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isUnread ? const Color(0xFFE8E0FF) : Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B48FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: notification['type'] == 'PUSH'
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
                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notification['title'],
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
                              notification['body'],
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
                              _formatTime(notification['sentAt']),
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
          ),
        ),
      ),
    );
  }
}
