import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/theme_extensions.dart';

import '../../core/constant/app_button.dart';
import '../../core/extensions/int_extension.dart';
import '../../core/theme/app_colors.dart';
import '../auth/widgets/app_textfield.dart';

class TempleteView extends StatefulWidget {
  const TempleteView({super.key});

  @override
  State<TempleteView> createState() => _TempleteViewState();
}

class _TempleteViewState extends State<TempleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text("My Template", style: context.text.displaySmall),
              Text(
                "Manage and deploy standardized estimate structures.",
                style: context.text.labelLarge!.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              23.vSpace,
              AppTextField(
                prefixIcon: Icon(Icons.search),
                hintText: "Serach templetes(e.g,Roofing,Electricty...)",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
