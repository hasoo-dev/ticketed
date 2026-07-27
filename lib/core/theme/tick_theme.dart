import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Legacy wrapper — delegates to [AppTheme].
/// Kept for backward-compatibility with existing imports.
class TickTheme {
  static ThemeData lightTheme() => AppTheme.lightTheme();
  static ThemeData darkTheme() => AppTheme.darkTheme();
}
