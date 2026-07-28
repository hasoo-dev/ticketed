import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';
import 'package:ticketed/core/constant/social_card.dart';
import 'package:ticketed/core/routes/routes_name.dart';
import 'package:ticketed/services/sign_in_services.dart';

import '../../../core/constant/app_button.dart';
import '../../../core/constant/app_fonts.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validators.dart';
import 'app_textfield.dart';
import 'brand_title.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final signInService = SignInService();

  @override
  void dispose() {
    signInService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Form(
            key: signInService.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: .start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Title
                BrandTitle(width: context.width * 0.36),
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
                  
                  controller: signInService.emailController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/ic_email.svg'),
                  ),
                  hintText: "name@company.com",
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
                  controller: signInService.passwordController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/ic_password.svg'),
                  ),
                  hintText: "*********",
                  
                  validator: (value) => Validators.password(value),
                  obscureText: true,
                ),
12.vSpace,
                Row(
                  mainAxisAlignment: .end,
                  crossAxisAlignment: .end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(RoutesName.forgetPassword);
                      },
                      child: Text(
                        'Forget Password?',
                        style: context.text.bodyLarge,
                      ),
                    ),
                  ],
                ),
                16.vSpace,

                // Login Button
                AppButton(
                  onPressed: () {
                    signInService.login(context);
                  },

                  text: 'SIGN IN',
                  textColor: Colors.white,
                  backgroundColor: context.colors.onSurface,
                  textSize: AppFonts.f16,
                ),

                23.vSpace,
                Row(
                  children: [
                    Expanded(child: Divider(endIndent: 12)),
                    Text("or contniue with"),
                    Expanded(child: Divider(indent: 12)),
                  ],
                ), // Notice Footer
                23.vSpace,
                SocialCard(),

                23.vSpace,
                Row(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      "New Here? ",
                      style: context.text.headlineSmall!.copyWith(
                        fontSize: AppFonts.f16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(RoutesName.signUp);
                      },
                      child: Text(
                        "Sign Up",
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
      ),
    );
  }
}
