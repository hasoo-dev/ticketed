import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';
import 'package:ticketed/features/forget_screen/widgets/forget_password_form.dart';

import '../../core/extensions/context_extension.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
    
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ForgetPasswordForm(),
    );
  }
}