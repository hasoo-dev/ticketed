import 'package:flutter/material.dart';

class AppShadow {
  static final List<BoxShadow> light = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.02),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static final List<BoxShadow> dark = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  static final List<BoxShadow> inputGlow = [
    BoxShadow(
      color: const Color(0xff62FCD5).withValues(alpha: 0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
      spreadRadius: 1,
    ),
  ];
}
