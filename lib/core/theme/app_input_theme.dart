import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_radius.dart';
import 'app_colors.dart';

class AppInputTheme {
  static InputDecorationTheme lightInputTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.lightTextTertiary,
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.lightTextSecondary,
      ),
      errorStyle: GoogleFonts.inter(
        fontSize: 12,
        color: AppColors.error,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: AppColors.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
    );
  }

  static InputDecorationTheme darkInputTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.darkTextTertiary,
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.darkTextSecondary,
      ),
      errorStyle: GoogleFonts.inter(
        fontSize: 12,
        color: AppColors.error,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.kPrimaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.br12,
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
    );
  }
}
