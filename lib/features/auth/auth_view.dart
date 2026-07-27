import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/features/auth/widgets/login_form.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: LoginForm(),
    );
  }
}
