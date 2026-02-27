import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    const double borderRadiusCard = 16.0;
    const double borderRadiusButton = 12.0;
    const double borderRadiusInput = 12.0;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.borderMedium,
        surface: AppColors.surfaceL1,
        onSurface: AppColors.textPrimary,
        secondary: AppColors.borderStrong,
        outline: AppColors.borderSubtle,
        error: AppColors.error,
      ),

      textTheme: TextTheme(
        // Display Large: Inter ExtraLight 200 · 32sp · tracking -0.5
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w200,
          color: AppColors.textPrimary,
          letterSpacing: -0.5,
        ),
        // Display Medium: Inter Light 300 · 28sp · tracking -0.3
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimary,
          letterSpacing: -0.3,
        ),
        // Heading 1: Inter Regular 400 · 24sp · tracking -0.2
        headlineLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          letterSpacing: -0.2,
        ),
        // Heading 2: Inter Regular 400 · 20sp · tracking 0
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          letterSpacing: 0,
        ),
        // Heading 3: Inter Medium 500 · 17sp · tracking 0
        headlineSmall: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
          letterSpacing: 0,
        ),
        // Body Large: Inter Regular 400 · 15sp · line height 1.6
        bodyLarge: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
          height: 1.6,
        ),
        // Body Medium: Inter Regular 400 · 14sp · line height 1.5
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
        // Body Small: Inter Regular 400 · 12sp · line height 1.4
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.4,
        ),
        // Label: Inter Medium 500 · 13sp · tracking 0.2
        labelLarge: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
          letterSpacing: 0.2,
        ),
        // Micro: Inter Regular 400 · 11sp · tracking 0.4
        labelSmall: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: AppColors.iconInactive,
          letterSpacing: 0.4,
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.surfaceL1,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusCard),
          side: const BorderSide(color: AppColors.borderSubtle, width: 1.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceL1,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusInput),
          borderSide: const BorderSide(
            color: AppColors.borderMedium,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusInput),
          borderSide: const BorderSide(
            color: AppColors.borderMedium,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusInput),
          borderSide: const BorderSide(
            color: AppColors.borderStrong,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusInput),
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 15,
          color: AppColors.textDisabled,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: GoogleFonts.inter(fontSize: 11, color: AppColors.error),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E1E1E),
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusButton),
            side: const BorderSide(color: AppColors.borderStrong, width: 1.0),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textSecondary,
          elevation: 0,
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusButton),
          ),
          side: const BorderSide(color: AppColors.borderMedium, width: 1.0),
          textStyle: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.background,
        height: 64,
        indicatorColor: AppColors.borderStrong,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.iconActive, size: 24);
          }
          return const IconThemeData(color: AppColors.iconInactive, size: 22);
        }),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textSecondary,
          size: 22,
        ),
        shape: const Border(
          bottom: BorderSide(color: AppColors.surfaceL2, width: 1.0),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceL2,
        thickness: 1.0,
        space: 1.0,
      ),
    );
  }

  // Helper for JetBrains Mono
  static TextStyle get codeStyle => GoogleFonts.jetBrainsMono(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.iconActive,
  );
}
