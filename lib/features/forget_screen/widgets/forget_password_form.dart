import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart' show SvgPicture;
import 'package:ticketed/features/auth/widgets/brand_title.dart' show BrandTitle;

import '../../../core/constant/app_button.dart';
import '../../../core/constant/app_fonts.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/utils/validators.dart';
import '../../auth/widgets/app_textfield.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: .start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Title
                BrandTitle(
                  title: "Reset your password",
                  subTitle: "Enter the email on your account and we'll send you a link to get back in.",
                  width: context.width * 0.36),
                23.vSpace,
                // Email Input
                Text(
                  'Email Address',
                  style: context.text.bodySmall!.copyWith(
                    color: const Color(0xFF475569),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                7.vSpace,
                AppTextField(
                  controller: emailController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/ic_email.svg'),
                  ),
                  hintText: "Enter the E-mail",
                  validator: (p0) => Validators.email(p0),
                ),

                
                16.vSpace,

                // Login Button
                AppButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  // isLoading: authState.isLoading,
                  text: 'SEND LINK',
                  textColor: Colors.white,
                  backgroundColor: context.colors.onSurface,
                  textSize: AppFonts.f16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
