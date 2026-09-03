import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/services/session_services.dart';
import '../core/routes/routes_name.dart';
import '../core/utils/app_logger.dart';
import '../core/utils/helpers.dart';

class SignInService {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final email = emailController.text.trim();
    AppLogger.i('Attempting sign in for: $email');

    try {
      await SessionService.instance.saveSession(
        id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
        email: email.isNotEmpty ? email : 'contractor@apexindustrial.com',
        name: 'Apex Contractor',
        businessName: 'Apex Industrial Contracting',
        trade: 'General Contractor',
        accessToken: 'sec_tok_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (!context.mounted) return;
      AppLogger.success('Sign in successful for: $email');

      Helpers.loginSuccess(
        context: context,
        onContinue: () {
          context.go(RoutesName.main);
        },
      );
    } catch (e, st) {
      if (!context.mounted) return;
      AppLogger.e('Login failed unexpectedly: $e', error: e, stackTrace: st);
      Helpers.showSnackBar(
        context,
        "An unexpected error occurred. Please try again.",
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
