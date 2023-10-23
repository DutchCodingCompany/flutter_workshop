import 'package:flutter/material.dart';
import 'package:flutter_workshop/theming/workshop_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: WorkshopColors.primary,
          onPrimary: WorkshopColors.white,
          secondary: WorkshopColors.secondary,
        ),
        scaffoldBackgroundColor: WorkshopColors.background,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            fontSize: 48,
            color: WorkshopColors.white,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: WorkshopColors.white,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: WorkshopColors.white,
          ),
          bodyLarge: GoogleFonts.mulish(
            fontSize: 24,
            color: WorkshopColors.white,
          ),
          bodyMedium: GoogleFonts.mulish(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: WorkshopColors.white,
          ),
          labelLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: WorkshopColors.white,
          ),
        ),
      );
}
