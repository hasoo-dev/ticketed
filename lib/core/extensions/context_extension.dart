import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // Screen dimensions
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  // Keyboard
  bool get isKeyboardOpen => MediaQuery.viewInsetsOf(this).bottom > 0;

  // Orientation
  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;

  String formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
