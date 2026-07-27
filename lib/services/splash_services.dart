import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/services/session_services.dart';

import '../core/routes/routes_name.dart';

class SplashServices {
  Future<void> navigateToMain(BuildContext context) async {
    const splashDelay = Duration(seconds: 6);

    try {
      await SessionService.instance.restoreSession();
      final isLoggedIn = SessionService.instance.isLoggedIn;

      Timer(splashDelay, () {
        if (!context.mounted) return;
        context.pushReplacement(isLoggedIn ? RoutesName.home : RoutesName.auth);
      });
    } catch (e) {
      Timer(splashDelay, () {
        if (!context.mounted) return;
        context.pushReplacement(RoutesName.auth);
      });
    }
  }
}