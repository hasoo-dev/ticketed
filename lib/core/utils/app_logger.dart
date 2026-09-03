import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Professional Application Logger wrapping the `logger` package.
/// Provides formatted, colored, and categorized logs with stack traces.
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 90,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: kReleaseMode ? Level.off : Level.trace,
  );

  /// Verbose / Trace level logging
  static void t(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Debug level logging
  static void d(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Info level logging
  static void i(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Info convenience alias
  static void info(dynamic message) {
    i(message);
  }

  /// Success logging with custom emoji
  static void success(dynamic message) {
    _logger.i('✅ [SUCCESS] $message');
  }

  /// Warning level logging
  static void w(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Warning convenience alias
  static void warning(dynamic message) {
    w(message);
  }

  /// Error level logging
  static void e(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Error convenience alias
  static void error(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    e(message, error: error, stackTrace: stackTrace);
  }

  /// Fatal / What a Terrible Failure logging
  static void f(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Visual divider in logs
  static void divider() {
    if (!kDebugMode) return;
    debugPrint('════════════════════════════════════════════════════════════════════════════');
  }
}