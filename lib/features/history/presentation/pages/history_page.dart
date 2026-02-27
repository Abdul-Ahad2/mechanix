import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Service History',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Your vehicle\'s\nComplete Care Log',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w200,
                color: AppColors.textPrimary,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'A chronological record of every diagnostic session, repair, and maintenance performed on your vehicle.',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            _buildStatsRow(),
            const SizedBox(height: 40),
            _buildFilterTabs(),
            const SizedBox(height: 24),
            _buildTimelineSection('February 2026', [
              _HistoryItem(
                title: 'Brake System Analysis',
                subtitle: 'AI Diagnostic session • High Severity',
                date: 'Feb 22',
                icon: HugeIcons.strokeRoundedAiChat02,
                isUrgent: true,
              ),
              _HistoryItem(
                title: 'Engine Oil Service',
                subtitle: 'ProAuto Service Center • Regular Maintenance',
                date: 'Feb 14',
                icon: HugeIcons.strokeRoundedTools,
              ),
            ]),
            const SizedBox(height: 24),
            _buildTimelineSection('January 2026', [
              _HistoryItem(
                title: 'Transmission Check',
                subtitle: 'Monthly health scan • Normal status',
                date: 'Jan 30',
                icon: HugeIcons.strokeRoundedAiChat02,
              ),
              _HistoryItem(
                title: 'Tire Rotation',
                subtitle: "Johnson's Garage • Scheduled",
                date: 'Jan 12',
                icon: HugeIcons.strokeRoundedTools,
              ),
            ]),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatCard('Services', '12', HugeIcons.strokeRoundedTools),
        const SizedBox(width: 12),
        _buildStatCard('Diagnoses', '08', HugeIcons.strokeRoundedAiChat02),
        const SizedBox(width: 12),
        _buildStatCard('Alerts', '02', HugeIcons.strokeRoundedAlertCircle),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, List<List<dynamic>> icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceL1,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HugeIcon(icon: icon, color: AppColors.textSecondary, size: 18),
            const SizedBox(height: 12),
            Text(
              value,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Row(
      children: [
        _buildFilterChip('All', true),
        const SizedBox(width: 8),
        _buildFilterChip('Services', false),
        const SizedBox(width: 8),
        _buildFilterChip('AI Sessions', false),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? Colors.white : AppColors.borderSubtle),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Colors.black : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTimelineSection(String month, List<_HistoryItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textDisabled,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildHistoryCard(item)),
      ],
    );
  }

  Widget _buildHistoryCard(_HistoryItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(16),
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
              icon: item.icon,
              color: item.isUrgent ? AppColors.statusDanger : AppColors.textSecondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.date,
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

class _HistoryItem {
  final String title;
  final String subtitle;
  final String date;
  final List<List<dynamic>> icon;
  final bool isUrgent;

  _HistoryItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.icon,
    this.isUrgent = false,
  });
}

