import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          'Settings',
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
            const SizedBox(height: 32),
            _buildSectionHeader('Account'),
            const SizedBox(height: 12),
            _buildSettingItem(HugeIcons.strokeRoundedUser, 'Personal Information'),
            _buildSettingItem(HugeIcons.strokeRoundedLockPassword, 'Security & Password'),
            const SizedBox(height: 32),
            _buildSectionHeader('Preferences'),
            const SizedBox(height: 12),
            _buildSettingItem(HugeIcons.strokeRoundedNotification01, 'Push Notifications', trailing: _buildToggle(true)),
            _buildSettingItem(HugeIcons.strokeRoundedLocation01, 'Location Services', trailing: _buildToggle(true)),
            const SizedBox(height: 32),
            _buildSectionHeader('Support'),
            const SizedBox(height: 12),
            _buildSettingItem(HugeIcons.strokeRoundedHelpCircle, 'Help & Support Center'),
            _buildSettingItem(HugeIcons.strokeRoundedInformationCircle, 'Terms of Service'),
            const SizedBox(height: 48),
            Center(
              child: Text(
                'MechaniX v1.0.0',
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textDisabled),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSettingItem(List<List<dynamic>> icon, String title, {Widget? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          HugeIcon(icon: icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          trailing ?? const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppColors.textDisabled, size: 18),
        ],
      ),
    );
  }

  Widget _buildToggle(bool isOn) {
    return Container(
      width: 44,
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isOn ? Colors.white : AppColors.surfaceL2,
      ),
      child: Align(
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? Colors.black : AppColors.textDisabled,
          ),
        ),
      ),
    );
  }
}

