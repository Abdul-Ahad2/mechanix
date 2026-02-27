import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/profile/presentation/pages/settings_page.dart';
import 'package:ai_mechanix/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:ai_mechanix/features/profile/presentation/pages/premium_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const HugeIcon(icon: HugeIcons.strokeRoundedSettings01, color: AppColors.textSecondary, size: 22),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildUserHeader(context),
            const SizedBox(height: 48),
            _buildSectionHeader('MY GARAGE'),
            const SizedBox(height: 16),
            _buildVehicleCard('Toyota Camry 2022', 'Silver • AUTO-8827'),
            const SizedBox(height: 40),
            _buildSectionHeader('ACCOUNT'),
            const SizedBox(height: 16),
            _buildMenuItem(HugeIcons.strokeRoundedCrown, 'Premium Plan', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumPage()))),
            _buildMenuItem(HugeIcons.strokeRoundedNotification01, 'Notifications'),
            _buildMenuItem(HugeIcons.strokeRoundedShield01, 'Privacy & Security'),
            _buildMenuItem(HugeIcons.strokeRoundedHelpCircle, 'Help & Support'),
            const SizedBox(height: 48),
            _buildLogoutAction(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceL1,
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Center(
            child: Text(
              'AJ',
              style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w300, color: AppColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Alex Johnson',
          style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w300, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          'alex.johnson@email.com',
          style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 24),
        OutlinedButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage())),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.borderSubtle),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            'Edit Profile',
            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleCard(String name, String info) {
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
            child: const HugeIcon(icon: HugeIcons.strokeRoundedCar01, color: AppColors.iconActive, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  info,
                  style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppColors.textDisabled, size: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(List<List<dynamic>> icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFF141414))),
        ),
        child: Row(
          children: [
            HugeIcon(icon: icon, color: AppColors.textSecondary, size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
              ),
            ),
            const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppColors.textDisabled, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutAction() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: AppColors.statusDanger,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.statusDanger.withOpacity(0.3)),
          ),
        ),
        child: Text(
          'Log Out',
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

