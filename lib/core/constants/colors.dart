import 'package:flutter/material.dart';

class AppColors {
  // Background & Surfaces
  static const Color background = Color(0xFF080808);
  static const Color surfaceL1 = Color(0xFF111111);
  static const Color surfaceL2 = Color(0xFF1A1A1A);
  static const Color surfaceL3 = Color(0xFF222222);
  
  // Borders
  static const Color borderSubtle = Color(0xFF1F1F1F);
  static const Color borderMedium = Color(0xFF2A2A2A);
  static const Color borderStrong = Color(0xFF3A3A3A);
  static const Color border = borderSubtle; // Alias for backward compatibility
  
  // Text
  static const Color textPrimary = Color(0xFFE0E0E0);
  static const Color textSecondary = Color(0xFF8A8A8A);
  static const Color textDisabled = Color(0xFF3D3D3D);
  static const Color textInverse = Color(0xFF080808);
  
  // Icons
  static const Color iconInactive = Color(0xFF555555);
  static const Color iconActive = Color(0xFFCCCCCC);

  // Status
  static const Color error = Color(0xFFC0392B);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFE67E22);
  static const Color statusDanger = error;
  static const Color statusSuccess = success;
  static const Color statusWarning = warning;

  // Legacy Aliases (to be phased out)
  static const Color surface = surfaceL1;
  static const Color elevatedSurface = surfaceL2;
  static const Color primaryAccent = Color(0xFFFFFFFF); // White for high contrast accents
  static const Color highlight = borderStrong;
}
