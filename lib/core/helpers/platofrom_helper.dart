import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

/// A simple cross-platform utility to get the current runtime platform
/// as a string suitable for API usage (ANDROID | IOS | WEB).
class PlatformHelper {
  static String get current {
    if (kIsWeb) return 'WEB';
    if (Platform.isAndroid) return 'ANDROID';
    if (Platform.isIOS) return 'IOS';
    if (Platform.isMacOS) return 'MACOS';
    if (Platform.isWindows) return 'WINDOWS';
    if (Platform.isLinux) return 'LINUX';
    return 'UNKNOWN';
  }

  /// Returns true if running on a mobile platform.
  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  /// Returns true if running on a web platform.
  static bool get isWeb => kIsWeb;

  /// Returns true if running on a desktop platform.
  static bool get isDesktop =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
}
