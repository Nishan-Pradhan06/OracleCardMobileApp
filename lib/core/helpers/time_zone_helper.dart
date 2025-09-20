import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

class TimezoneHelper {
  /// Get current timezone as a string
  static Future<String> getTimezone() async {
    try {
      if (kIsWeb) {
        // Web fallback: only UTC offset
        final now = DateTime.now();
        final offset = now.timeZoneOffset;
        final hours = offset.inHours;
        final minutes = offset.inMinutes.remainder(60);
        final sign = hours >= 0 ? '+' : '-';
        return 'UTC$sign${hours.abs().toString().padLeft(2, '0')}:${minutes.abs().toString().padLeft(2, '0')}';
      }

      return await FlutterTimezone.getLocalTimezone();
    } catch (e) {
      debugPrint('Error fetching timezone: $e');
      return 'Unknown';
    }
  }

  /// Set timezone into a TextEditingController
  static Future<void> setTimezone(TextEditingController controller) async {
    controller.text = await getTimezone();
  }
}
