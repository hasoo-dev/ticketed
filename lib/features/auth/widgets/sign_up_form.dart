import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:ticketed/core/routes/routes_name.dart';

import '../../../core/constant/app_button.dart';
import '../../../core/constant/app_fonts.dart' show AppFonts;
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/theme/app_colors.dart' show AppColors;
import '../../../core/utils/helpers.dart';
import '../../../core/utils/validators.dart';
import 'app_check_box.dart';
import 'app_textfield.dart';
import 'brand_title.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool agreeTerms = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Branded Header with Logo
              BrandTitle(
                title: "Let's get your first quote out",
                subTitle:
                    "We'll set you up with starter templates for your trade — takes about 2 minutes.",
                width: 90,
              ),
              18.vSpace,
              // Business Name Input
              Text(
                'Business Name',
                style: context.text.bodySmall!.copyWith(
                  color: const Color(0xFF475569),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.vSpace,
              AppTextField(
                controller: fullNameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/ic_org.svg'),
                ),
                hintText: "e.g. Accurate Electrical Services",
                validator: (p0) => Validators.required(p0),
              ),
              12.vSpace,
              // Email Input
              Text(
                'Email Address',
                style: context.text.bodySmall!.copyWith(
                  color: const Color(0xFF475569),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.vSpace,
              AppTextField(
                controller: emailController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/ic_email.svg'),
                ),
                hintText: "name@company.com",
                validator: (p0) => Validators.email(p0),
              ),
              12.vSpace,
              // Password Input
              Text(
                'Password',
                style: context.text.bodyMedium!.copyWith(
                  color: const Color(0xFF475569),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.vSpace,
              AppTextField(
                controller: passwordController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/ic_password.svg'),
                ),
                hintText: "Min. 8 characters",
                validator: (value) => Validators.password(value),
                obscureText: true,
              ),
              12.vSpace,
              AppCheckbox(
                value: agreeTerms,
                text:
                    "I agree to the Terms of Service and confirm I am a registered trade professional.",
                onChanged: (value) {
                  setState(() {
                    agreeTerms = value ?? false;
                  });
                },
              ),
              16.vSpace,
              // Create Account Button
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (!agreeTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please agree to the Terms of Service.")),
                      );
                      return;
                    }
                    Helpers.showAppBottomSheet(
                      context,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 44,
                              backgroundColor: const Color(0xffDCFCE7),
                              child: const Icon(
                                Icons.check_circle_rounded,
                                size: 60,
                                color: Color(0xff16A34A),
                              ),
                            ),
                            14.vSpace,
                            Text(
                              "🎉 You're All Set!",
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                            ),
                            8.vSpace,
                            Text(
                              'Your Ticketed estimating workspace is ready. Pick your trade to customize starter templates.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                            ),
                            20.vSpace,
                            AppButton(
                              onPressed: () {
                                Navigator.pop(context);
                                context.pushReplacement(RoutesName.trade);
                              },
                              backgroundColor: AppColors.darkBorder,
                              textColor: Colors.white,
                              text: 'Continue to Trade Selection →',
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                text: 'CREATE ACCOUNT ',
                textColor: Colors.white,
                backgroundColor: context.colors.onSurface,
                textSize: AppFonts.f16,
              ),
              24.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already using Ticketed? ",
                    style: context.text.headlineSmall!.copyWith(
                      fontSize: AppFonts.f12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sign In",
                      style: context.text.headlineSmall!.copyWith(
                        fontSize: AppFonts.f12,
                        color: AppColors.info,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              16.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
