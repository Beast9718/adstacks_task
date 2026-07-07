import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextTheme get textTheme {
    return GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: AppColors.textMain,
      ),
      displayMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.textMain,
      ),
      displaySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: AppColors.textMain,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.textMain,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        color: AppColors.textMain,
      ),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.textMain,
      ),
      titleSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: AppColors.textMain,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: AppColors.textSub,
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: AppColors.textSub,
      ),
    );
  }
}

