import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:ticketed/features/splash/widgtes/progress_demo.dart';

import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/utils/helpers.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        ZoomInDown(
          duration: Durations.extralong1,
          child: Image.asset(
            "assets/icons/ic_ticketed.png",
            width: Helpers.screenHeight(context) * 0.15,
          ),
        ),
        4.vSpace,
        FadeIn(
          duration: Durations.extralong1,
          delay: Durations.long1,
          child: Text(
            "Ticketed",
            style: context.text.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        12.vSpace,
        FadeIn(
          duration: Durations.long1,
          delay: Durations.long1,
          child: Text(
            "quote it, send it, get it signed",
            style: context.text.labelLarge,
          ),
        ),
        83.vSpace,
        FadeIn(
          duration: Durations.extralong1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 87.0, vertical: 3),
            child: ProgressDemo(),
          ),
        ),
      ],
    );
  }
}
