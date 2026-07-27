import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static const _reset = '\x1B[0m';

  static const _blue = '\x1B[34m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _red = '\x1B[31m';
  static const _cyan = '\x1B[36m';
  static const _purple = '\x1B[35m';

  static void info(String message) {
    if (!kDebugMode) return;

    debugPrint('$_blueℹ️  INFO$_reset  $message');
  }

  static void success(String message) {
    if (!kDebugMode) return;

    debugPrint('$_green✅ SUCCESS$_reset  $message');
  }

  static void warning(String message) {
    if (!kDebugMode) return;

    debugPrint('$_yellow⚠️  WARNING$_reset  $message');
  }

  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    debugPrint('$_red❌ ERROR$_reset  $message');

    if (error != null) {
      debugPrint('$_purple$error$_reset');
    }

    if (stackTrace != null) {
      debugPrint('$_cyan$stackTrace$_reset');
    }
  }

  static void divider() {
    if (!kDebugMode) return;

    debugPrint(
      '════════════════════════════════════════════════════════════════════════════',
    );
  }
}