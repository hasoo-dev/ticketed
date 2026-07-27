import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:ticketed/core/routes/routes_name.dart';

import '../../../core/constant/app_button.dart';
import '../../../core/constant/app_fonts.dart' show AppFonts;
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/theme/app_colors.dart' show AppColors;
import '../../../core/utils/helpers.dart';
import '../../../core/utils/validators.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                title: "Let's get your first quote out",
                subTitle:
                    "We'll set you up with starter templates for your trade — takes about 2 minutes.",
                width: context.width * 0.33,
              ),
              23.vSpace,
              // Email Input
              Text(
                'Full Org. Name',
                style: context.text.bodySmall!.copyWith(
                  color: const Color(0xFF475569),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              7.vSpace,
              AppTextField(
                controller: fullNameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/ic_org.svg'),
                ),
                hintText: "Enter the Qrg. Name",
                validator: (p0) => Validators.required(p0),
              ),
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

              // Password Input
              Text(
                'Password',
                style: context.text.bodyMedium!.copyWith(
                  color: const Color(0xFF475569),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              7.vSpace,
              AppTextField(
                controller: passwordController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/ic_password.svg'),
                ),
                hintText: "Enter the Password",
                validator: (value) => Validators.password(value),
                obscureText: true,
              ),
              16.vSpace,

              // Login Button
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Helpers.showAppBottomSheet(
                      context,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.green.shade50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 70,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              "🎉  You're All Set!",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Your account has been created successfully.Start exploring exciting events and bookyour favourite experiences with ease.',
                            ),
                            const SizedBox(height: 20),
                            AppButton(
                              onPressed: () {
                                Navigator.pop(context);
                                context.pushReplacement(RoutesName.trade);
                              },
                              backgroundColor: AppColors.darkBorder,
                              textColor: Colors.white,
                              text: 'Continue',
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                // isLoading: authState.isLoading,
                text: 'SIGN UP',
                textColor: Colors.white,
                backgroundColor: context.colors.onSurface,
                textSize: AppFonts.f16,
              ),

              // Notice Footer
              23.vSpace,
              Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    "If you already have the account? ",
                    style: context.text.headlineSmall!.copyWith(
                      fontSize: AppFonts.f16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sign In",
                      style: context.text.headlineSmall!.copyWith(
                        fontSize: AppFonts.f16,
                        color: AppColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
