import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedCrown,
              color: AppColors.iconActive,
              size: 72,
            ),
            const SizedBox(height: 32),
            Text(
              'MechaniX Premium',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Unlock the full potential of AI-driven automotive maintenance and priority local assistance.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            _buildFeatureList(),
            const SizedBox(height: 48),
            _buildPlanCard('Monthly', 'PKR 699', 'Billed monthly'),
            const SizedBox(height: 12),
            _buildPlanCard('Annual', 'PKR 6,999', 'Billed annually • Save 15%', isPopular: true),
            const SizedBox(height: 56),
            _buildPrimaryAction(context),
            const SizedBox(height: 16),
            Text(
              'Cancel anytime. Terms & Conditions apply.',
              style: GoogleFonts.inter(fontSize: 12, color: AppColors.textDisabled),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureList() {
    return Column(
      children: [
        _buildFeatureItem(HugeIcons.strokeRoundedAiMagic, 'Unlimited AI Diagnostics'),
        _buildFeatureItem(HugeIcons.strokeRoundedClock01, 'Priority Booking at Top Garages'),
        _buildFeatureItem(HugeIcons.strokeRoundedShield01, 'Premium SOS Assistance'),
        _buildFeatureItem(HugeIcons.strokeRoundedAiChat02, 'Full Vehicle Health Reports'),
      ],
    );
  }

  Widget _buildFeatureItem(List<List<dynamic>> icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          HugeIcon(icon: icon, color: AppColors.iconActive, size: 20),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(String title, String price, String subtitle, {bool isPopular = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isPopular ? AppColors.iconActive : AppColors.borderSubtle,
          width: isPopular ? 1.5 : 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary),
              ),
            ],
          ),
          Text(
            price,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryAction(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Text(
          'Start 7-Day Free Trial',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

