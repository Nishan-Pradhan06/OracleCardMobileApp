import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Converts an ISO string (e.g. "2025-10-04T09:50:41.846Z")
  /// into a formatted string like:
  /// "Today, 10:30 AM", "Yesterday, 3:15 PM", or "Oct 4, 2025, 9:50 AM"
  static String formatReadableDate(String isoDate) {
    if (isoDate.isEmpty) return '';

    try {
      final date = DateTime.parse(isoDate).toLocal();
      final now = DateTime.now();
      final dateFormat = DateFormat('h:mm a');

      final isToday =
          date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;

      final isYesterday =
          date.year == now.year &&
          date.month == now.month &&
          date.day == now.day - 1;

      if (isToday) {
        return "Today, ${dateFormat.format(date)}";
      } else if (isYesterday) {
        return "Yesterday, ${dateFormat.format(date)}";
      } else {
        final fullFormat = DateFormat('MMM d, yyyy, h:mm a');
        return fullFormat.format(date);
      }
    } catch (e) {
      return isoDate; // fallback to raw string if parsing fails
    }
  }

  /// 📅 Converts ISO date string to a short format like "Jun 15, 6:00 PM"
  static String formatShortDate(String isoDate) {
    if (isoDate.isEmpty) return '';

    try {
      final date = DateTime.parse(isoDate).toLocal();
      final shortFormat = DateFormat('MMM d, h:mm a');
      return shortFormat.format(date);
    } catch (e) {
      return isoDate;
    }
  }
}
