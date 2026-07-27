import 'package:flutter/material.dart';

extension DoubleExtension on double {
  /// Vertical SizedBox: `16.0.vSpace`
  SizedBox get vSpace => SizedBox(height: this);

  /// Horizontal SizedBox: `16.0.hSpace`
  SizedBox get hSpace => SizedBox(width: this);

  /// BorderRadius: `12.0.radius`
  BorderRadius get radius => BorderRadius.circular(this);

  /// EdgeInsets all sides: `16.0.paddingAll`
  EdgeInsets get paddingAll => EdgeInsets.all(this);

  /// EdgeInsets symmetric horizontal: `16.0.paddingH`
  EdgeInsets get paddingH => EdgeInsets.symmetric(horizontal: this);

  /// EdgeInsets symmetric vertical: `16.0.paddingV`
  EdgeInsets get paddingV => EdgeInsets.symmetric(vertical: this);

  /// Responsive fontSize: `16.0.sp`
  double get sp =>
      this *
      (1.11 +
          ((MediaQueryData.fromView(
                        WidgetsBinding.instance.window,
                      ).devicePixelRatio -
                      3.65)
                  .clamp(-0.5, 1.0) /
              12.0));
              
}
