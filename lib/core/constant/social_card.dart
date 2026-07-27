import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:ticketed/core/extensions/int_extension.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/core/theme/app_colors.dart';

import '../extensions/context_extension.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: context.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        // color: AppColors.darkSurface,
        border: Border.all(width: 1, color: Colors.black26),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_google.svg",
            width: context.width * 0.06,
          ),
          5.hSpace,
          Text(
            "Sign with Google",
            style: context.text.bodySmall!.copyWith(
              color: AppColors.darkBg,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
