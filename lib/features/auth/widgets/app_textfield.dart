import 'package:flutter/material.dart';
import 'package:ticketed/core/extensions/context_extension.dart';

import '../../../core/constant/app_radius.dart';
import '../../../core/extensions/int_extension.dart';
import '../../../core/extensions/theme_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/helpers.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 88),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        cursorColor: AppColors.darkBg,
        readOnly: readOnly,
        onTap: onTap,

        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontSize: 14.sp),
        onChanged: onChanged,
        focusNode: focusNode,
        onTapOutside: (event) {
          Helpers.hideKeyboard(context);
        },

        textInputAction: textInputAction,
        decoration: InputDecoration(
          
          hintText: hintText,
          hintStyle: context.text.titleLarge?.copyWith(
            fontSize: 14.sp,
            color: Colors.black54,
          ),
          labelText: labelText,
          labelStyle: context.text.titleLarge?.copyWith(
            fontSize: 14.sp,
            color: Colors.black54,
          ),

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: AppRadius.br12,
            borderSide: BorderSide(color: AppColors.darkBg),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.br12,
            borderSide: BorderSide(color: AppColors.darkBg),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadius.br12,
            borderSide: BorderSide(color: AppColors.error),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadius.br12,
            borderSide: BorderSide(color: AppColors.darkBg),
          ),
          errorStyle: context.text.bodyMedium?.copyWith(
            color: Colors.red,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
