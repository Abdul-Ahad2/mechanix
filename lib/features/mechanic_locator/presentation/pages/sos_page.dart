import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft02,
            color: AppColors.textSecondary,
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Emergency SOS',
          style: GoogleFonts.dmSans(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: AppColors.statusDanger,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            _buildSOSButton(),
            const SizedBox(height: 48),
            Text(
              'Transmitting Location...',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'H-12 Sector, Islamabad',
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            _buildEmergencyAction('Call Tow Truck', HugeIcons.strokeRoundedDeliveryTruck02),
            const SizedBox(height: 12),
            _buildEmergencyAction('Mobile Mechanic', HugeIcons.strokeRoundedTools),
            const SizedBox(height: 40),
            _buildCancelAction(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSOSButton() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.statusDanger.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.statusDanger.withValues(alpha: 0.3), width: 2),
      ),
      child: Center(
        child: Container(
          width: 140,
          height: 140,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.statusDanger,
            boxShadow: [
              BoxShadow(
                color: AppColors.statusDanger,
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Center(
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedAlertCircle,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyAction(String label, List<List<dynamic>> icon) {
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceL2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: HugeIcon(icon: icon, color: AppColors.statusDanger, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.dmSans(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const HugeIcon(icon: HugeIcons.strokeRoundedCall, color: AppColors.statusDanger, size: 20),
        ],
      ),
    );
  }

  Widget _buildCancelAction(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.borderSubtle),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          'I am Safe Now',
          style: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

