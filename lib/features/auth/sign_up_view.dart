import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/context_extension.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/features/auth/widgets/sign_up_form.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SignUpForm(),
    );
  }
}
