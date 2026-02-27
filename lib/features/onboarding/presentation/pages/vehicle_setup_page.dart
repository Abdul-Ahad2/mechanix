import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/onboarding/presentation/pages/onboarding_success_page.dart';

class VehicleSetupPage extends StatefulWidget {
  const VehicleSetupPage({super.key});

  @override
  State<VehicleSetupPage> createState() => _VehicleSetupPageState();
}

class _VehicleSetupPageState extends State<VehicleSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft02,
            color: AppColors.textSecondary,
            size: 22,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Vehicle Setup',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Thin progress line
          Container(
            height: 2,
            width: double.infinity,
            color: AppColors.surfaceL3,
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.75, // Assuming this is step 3 of 4
              child: Container(color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  _buildDropdownField('Manufacturer', 'Select car make'),
                  const SizedBox(height: 16),
                  _buildDropdownField('Model', 'Select model'),
                  const SizedBox(height: 16),
                  _buildDropdownField('Year', 'Select production year'),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'VIN (Optional)',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedUser,
                          color: AppColors.iconInactive,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingSuccessPage()),
                );
              },
              child: const Text('Complete Setup'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surfaceL1,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMedium),
          ),
          child: Row(
            children: [
              Text(
                hint,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.textDisabled,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const HugeIcon(
                icon: HugeIcons.strokeRoundedCircleArrowDown01,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

