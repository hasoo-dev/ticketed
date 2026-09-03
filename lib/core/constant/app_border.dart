import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'app_radius.dart';

class AppBorder {
  static final BorderSide activeBorderSide = const BorderSide(
    color: AppColors.kPrimaryColor,
    width: 1.5,
  );

  static final BorderSide inactiveBorderSide = BorderSide(
    color: Colors.grey.withValues(alpha: 0.3),
    width: 1.0,
  );

  static final BorderSide errorBorderSide = const BorderSide(
    color: Colors.red,
    width: 1.5,
  );

  static final Border borderAllLight = Border.all(
    color: Colors.grey.shade200,
    width: 1.0,
  );

  static final Border borderAllDark = Border.all(
    color: Colors.grey.shade800,
    width: 1.0,
  );

  static final OutlineInputBorder inputBorderOutline = OutlineInputBorder(
    borderRadius: AppRadius.br8,
    borderSide: BorderSide(color: Colors.grey.shade300),
  );

  static final OutlineInputBorder inputBorderFocused = OutlineInputBorder(
    borderRadius: AppRadius.br8,
    borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
  );

  static final OutlineInputBorder inputBorderError = OutlineInputBorder(
    borderRadius: AppRadius.br8,
    borderSide: const BorderSide(color: Colors.red, width: 1.5),
  );
}
