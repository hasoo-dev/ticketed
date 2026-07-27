import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/services/session_services.dart';
import '../core/routes/routes_name.dart';
import '../core/utils/helpers.dart';

class SignInService {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(
    BuildContext context, {
    required ValueChanged<bool> onLoadingChanged,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    onLoadingChanged(true);

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // TODO: replace with real API/Firebase call — this should return
      // the user/session JSON your backend sends back on successful login.
      await Future.delayed(const Duration(seconds: 1));
      final fakeResponse = {
        'id': 'usr_123',
        'email': email,
        'password':password,
        'businessName': 'Riverside Electric',
      };

      // Persist the session. Without this, login "succeeds" but nothing
      // survives app restart, and the splash screen's restoreSession()
      // check will always fail right after a successful login.
      await SessionService.instance.saveSession(fakeResponse);

      if (!context.mounted) return;
      onLoadingChanged(false);

      await Helpers.loginSuccess(
        context: context,
        onContinue: () {
          if (!context.mounted) return;
          context.go(RoutesName.home);
        },
      );
    } catch (e) {
      debugPrint("Login Error: $e");
      onLoadingChanged(false);
      if (!context.mounted) return;
      Helpers.showSnackBar(context, "Login failed. Please try again.", isError: true);
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}