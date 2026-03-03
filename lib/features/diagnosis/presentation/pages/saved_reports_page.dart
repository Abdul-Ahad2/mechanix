import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class SavedReportsPage extends StatelessWidget {
  const SavedReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        title: Text(
          'Reports',
          style: GoogleFonts.dmSans(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: -1,
          ),
        ),
        actions: [
          IconButton(
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft02, color: AppColors.textSecondary, size: 22),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 16),
        ],
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 8),
          _buildReportCard(
            title: 'Brake System Analysis',
            car: 'Toyota Camry 2022',
            date: 'Feb 22, 2026',
            status: 'URGENT',
            isUrgent: true,
          ),
          _buildReportCard(
            title: 'Engine Misfire Scan',
            car: 'Toyota Camry 2022',
            date: 'Feb 08, 2026',
            status: 'ATTENTION',
            isAttention: true,
          ),
          _buildReportCard(
            title: 'AC Performance Check',
            car: 'Toyota Camry 2022',
            date: 'Jan 05, 2026',
            status: 'HEALTHY',
          ),
          _buildReportCard(
            title: 'Transmission Fluid Status',
            car: 'Toyota Camry 2022',
            date: 'Dec 18, 2025',
            status: 'HEALTHY',
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String car,
    required String date,
    required String status,
    bool isUrgent = false,
    bool isAttention = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceL2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedAiChat02,
              color: isUrgent
                  ? AppColors.statusDanger
                  : isAttention
                      ? AppColors.statusWarning
                      : AppColors.statusSuccess,
              size: 24,
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
                const SizedBox(height: 4),
                Text(
                  '$car • $date',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isUrgent
                      ? AppColors.statusDanger
                      : isAttention
                          ? AppColors.statusWarning
                          : AppColors.statusSuccess,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: AppColors.textDisabled,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

