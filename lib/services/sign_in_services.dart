import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketed/services/session_services.dart';
import '../core/routes/routes_name.dart';
import '../core/utils/helpers.dart';

class SignInService {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    // 1. Validate Form First
    if (!(formKey.currentState?.validate() ?? false)) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      // 2. Call Supabase Auth API

      // final response = await Supabase.instance.client.auth.signInWithPassword(
      //   email: email,
      //   password: password,
      // );

      // 3. Safety Check: Ensure the widget is still in the tree after async execution
      if (!context.mounted) return;

      Helpers.loginSuccess(
        context: context,
        onContinue: () {
          context.go(RoutesName.main);
        },
      );
    } catch (e) {
      // 5. Catch unexpected generic errors (e.g., No internet connection)
      if (!context.mounted) return;
      debugPrint("Login failed unexpectedly: $e");
      Helpers.showSnackBar(
        context,
        "An unexpected error occurred. Please try again.",
      );
    }
  }

  // Future<void> login(BuildContext context) async {
  //   if (!(formKey.currentState?.validate() ?? false)) return;
  //   try {
  //     final email = emailController.text.trim();
  //     final password = passwordController.text.trim();
  //     final success = {"email": email, "pasword": password};

  //     Helpers.loginSuccess(context: context);
  //   } catch (e) {
  //     debugPrint("Lfoin failed $e");
  //     Helpers.showSnackBar(context, "Login failed $e");
  //   }
  // }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
