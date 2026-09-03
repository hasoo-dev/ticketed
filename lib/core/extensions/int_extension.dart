import 'dart:ui';
import 'package:flutter/material.dart';

extension IntExtension on int {
  /// Vertical SizedBox: `16.vSpace`
  SizedBox get vSpace => SizedBox(height: toDouble());

  /// Horizontal SizedBox: `16.hSpace`
  SizedBox get hSpace => SizedBox(width: toDouble());

  /// Duration in milliseconds: `300.ms`
  Duration get ms => Duration(milliseconds: this);

  /// Duration in seconds: `2.seconds`
  Duration get seconds => Duration(seconds: this);

  /// Duration in minutes: `5.minutes`
  Duration get minutes => Duration(minutes: this);

  /// BorderRadius: `12.radius`
  BorderRadius get radius => BorderRadius.circular(toDouble());

  /// EdgeInsets all: `16.paddingAll`
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());

  /// Responsive fontSize: `16.0.sp`
  double get sp {
    final view = PlatformDispatcher.instance.views.firstOrNull;
    final pixelRatio = view != null ? MediaQueryData.fromView(view).devicePixelRatio : 3.0;
    return toDouble() * (1.11 + ((pixelRatio - 3.65).clamp(-0.5, 1.0) / 12.0));
  }
}
