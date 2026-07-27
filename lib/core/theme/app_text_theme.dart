import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_fonts.dart';
import 'app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f40,
        fontWeight: FontWeight.w800,
        color: AppColors.lightTextPrimary,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f32,
        fontWeight: FontWeight.w700,
        color: AppColors.lightTextPrimary,
      ),
      displaySmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f28,
        fontWeight: FontWeight.w700,
        color: AppColors.lightTextPrimary,
      ),
      headlineMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f24,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
      ),
      headlineSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
      ),
      titleLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f18,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
      ),
      titleSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextSecondary,
      ),
      bodyLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextSecondary,
      ),
      labelLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f10,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextTertiary,
        letterSpacing: 0.5,
      ),
    );
  }

  static TextTheme darkTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f40,
        fontWeight: FontWeight.w800,
        color: AppColors.darkTextPrimary,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f32,
        fontWeight: FontWeight.w700,
        color: AppColors.darkTextPrimary,
      ),
      displaySmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f28,
        fontWeight: FontWeight.w700,
        color: AppColors.darkTextPrimary,
      ),
      headlineMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f24,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
      headlineSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
      titleLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),
      titleSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextSecondary,
      ),
      bodyLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: "san",

        fontSize: AppFonts.f12,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextSecondary,
      ),
      labelLarge: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f14,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontFamily: "san",
        fontSize: AppFonts.f10,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextTertiary,
        letterSpacing: 0.5,
      ),
    );
  }
}
