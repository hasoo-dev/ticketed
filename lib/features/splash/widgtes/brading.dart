import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart'
    show ThemeExtension;

class Brading extends StatelessWidget {
  const Brading({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Durations.extralong1,
      child: Container(
        padding: EdgeInsets.only(bottom: 12.toDouble()),
        height: 35,
        alignment: Alignment.center,
        child: Text("MADE BY HASSOO 🎫", style: context.text.labelLarge),
      ),
    );
  }
}
