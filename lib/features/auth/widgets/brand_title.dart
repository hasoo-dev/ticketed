import 'package:flutter/material.dart';
import '../../../core/constant/app_fonts.dart';
import '../../../core/extensions/theme_extensions.dart';

class BrandTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final double width;
  const BrandTitle({
    super.key,
    this.title = "Welcome to Ticketed",
    this.subTitle = "Sign in to pick up where you left off.",
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return // Brand Icon
    Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Image.asset("assets/icons/ic_ticketed.png", width: width),

        Text(
          title,
          style: context.text.bodySmall!.copyWith(
            color: const Color(0xFF0F172A),
            fontSize: AppFonts.f24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: context.text.bodySmall!.copyWith(
            fontSize: AppFonts.f18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
