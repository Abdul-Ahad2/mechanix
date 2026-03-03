import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/photo_preview_page.dart';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/chat_page.dart';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/acoustic_recording_page.dart';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/saved_reports_page.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'AI Diagnosis',
                style: GoogleFonts.dmSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 24),
              _FeatureCard(
                title: 'Comprehensive scan',
                subtitle: 'Perform a deep system analysis of all modules',
                buttonText: 'Initialize scan',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatPage())),
              ),
              const SizedBox(height: 32),
              Text(
                'Diagnostic Modes',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _DiagnosticModeCard(
                      icon: HugeIcons.strokeRoundedMic01,
                      label: 'Acoustic',
                      stats: 'Active',
                      color: AppColors.accentLime,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AcousticRecordingPage())),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _DiagnosticModeCard(
                      icon: HugeIcons.strokeRoundedCamera01,
                      label: 'Visual',
                      stats: '84%',
                      color: AppColors.accentPurple,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PhotoPreviewPage())),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _DiagnosticModeCard(
                      icon: HugeIcons.strokeRoundedAiChat02,
                      label: 'AI Chat',
                      stats: 'Ready',
                      color: AppColors.accentCyan,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatPage())),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _DiagnosticModeCard(
                      icon: HugeIcons.strokeRoundedFile01,
                      label: 'Saved',
                      stats: '12',
                      color: AppColors.surfaceL1,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedReportsPage())),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Recent Reports',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              _ReportCard(
                title: 'Brake Pad Wear',
                severity: 'High',
                severityColor: AppColors.statusDanger,
                date: '2d ago',
              ),
              const SizedBox(height: 12),
              _ReportCard(
                title: 'Engine Misfire',
                severity: 'Moderate',
                severityColor: AppColors.statusWarning,
                date: '1w ago',
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

}

class _DiagnosticModeCard extends StatelessWidget {
  final List<List<dynamic>> icon;
  final String label;
  final String stats;
  final Color color;
  final VoidCallback onTap;

  const _DiagnosticModeCard({
    required this.icon,
    required this.label,
    required this.stats,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = color == AppColors.surfaceL1;
    final textColor = isDark ? AppColors.textPrimary : AppColors.textInverse;

    return AspectRatio(
      aspectRatio: 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceL2 : Colors.black.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: HugeIcon(
                  icon: icon,
                  color: textColor,
                  size: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stats,
                    style: GoogleFonts.dmSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isDark ? AppColors.textSecondary : textColor.withValues(alpha: 0.7),
                        ),
                      ),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                        color: textColor,
                        size: 14,
                      ),
                    ],
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

class _FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surfaceL2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedAiMagic,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentLime,
              foregroundColor: AppColors.textInverse,
              minimumSize: const Size(120, 48),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final String severity;
  final Color severityColor;
  final String date;

  const _ReportCard({
    required this.title,
    required this.severity,
    required this.severityColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceL2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedFile01,
              color: AppColors.iconActive,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: severityColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      severity,
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            date,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              color: AppColors.textDisabled,
            ),
          ),
        ],
      ),
    );
  }
}

