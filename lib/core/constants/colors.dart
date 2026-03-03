import 'package:flutter/material.dart';

class AppColors {
  // Background & Surfaces
  static const Color background = Color(0xFF000000);
  static const Color surfaceL1 = Color(0xFF121212);
  static const Color surfaceL2 = Color(0xFF1E1E1E);
  static const Color surfaceL3 = Color(0xFF2C2C2C);
  
  // Primary accent (only colored value)
  static const Color accentPurple = Color(0xFFD4C7FF); // #d4c7ff
  // legacy aliases kept for compatibility – point to the same purple shade
  static const Color accentLime = accentPurple;
  static const Color accentCyan = accentPurple;
  
  // Borders
  static const Color borderSubtle = Color(0xFF1A1A1A);
  static const Color borderMedium = Color(0xFF262626);
  static const Color borderStrong = Color(0xFF333333);
  static const Color border = borderSubtle;
  
  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textDisabled = Color(0xFF4D4D4D);
  static const Color textInverse = Color(0xFF000000);
  
  // Icons
  static const Color iconInactive = Color(0xFF666666);
  static const Color iconActive = Color(0xFFFFFFFF);

  // Status
  // only using purple accent/white/black shades for statuses
  static const Color error = accentPurple;
  static const Color success = accentPurple;
  static const Color warning = accentPurple;
  static const Color statusDanger = error;
  static const Color statusSuccess = success;
  static const Color statusWarning = warning;

  // Legacy Aliases
  static const Color surface = surfaceL1;
  static const Color elevatedSurface = surfaceL2;
  static const Color primaryAccent = accentPurple; 
  static const Color highlight = accentPurple;
}
