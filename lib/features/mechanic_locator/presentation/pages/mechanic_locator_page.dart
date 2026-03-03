import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/mechanic_locator/presentation/pages/garage_details_page.dart';
import 'package:ai_mechanix/features/mechanic_locator/presentation/pages/sos_page.dart';

class MechanicLocatorPage extends StatelessWidget {
  const MechanicLocatorPage({super.key});


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
          'Mechanic Locator',
          style: GoogleFonts.dmSans(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedAlertCircle,
              color: AppColors.statusDanger,
              size: 22,
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SOSPage())),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: _buildSearchAndFilter(),
          ),
          Expanded(
            child: Stack(
              children: [
                _buildMapPlaceholder(),
                _buildDraggableList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Column(
      children: [
        // fixed height so the chips can match it
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceL1,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: TextField(
            style: GoogleFonts.dmSans(fontSize: 15, color: AppColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Search for services or garages...',
              hintStyle: GoogleFonts.dmSans(fontSize: 14, color: AppColors.textDisabled),
              border: InputBorder.none,
              icon: const HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: AppColors.textDisabled, size: 20),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FilterChip(height: 48, label: 'All', isActive: true),
              const SizedBox(width: 8),
              _FilterChip(height: 48, label: 'Engine', isActive: false),
              const SizedBox(width: 8),
              _FilterChip(height: 48, label: 'Brakes', isActive: false),
              const SizedBox(width: 8),
              _FilterChip(height: 48, label: 'Electrical', isActive: false),
              const SizedBox(width: 8),
              _FilterChip(height: 48, label: 'Diagnostics', isActive: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      color: const Color(0xFF0F0F0F),
      child: Center(
        child: HugeIcon(
          icon: HugeIcons.strokeRoundedMapsLocation01,
          color: AppColors.textDisabled.withValues(alpha: 0.1),
          size: 120,
        ),
      ),
    );
  }

  Widget _buildDraggableList(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border.all(color: AppColors.borderSubtle),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceL3,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }
              return _MechanicCard(
                name: index == 1 ? 'ProAuto Center' : index == 2 ? 'QuickFix Garage' : 'Elite Motors',
                distance: '10km',
                rating: 4.8,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GarageDetailsPage())),
              );
            },
          ),
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final double height;

  const _FilterChip({required this.label, required this.isActive, this.height = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : AppColors.surfaceL1,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: isActive ? Colors.white : AppColors.borderSubtle),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? Colors.black : AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _MechanicCard extends StatelessWidget {
  final String name;
  final String distance;
  final double rating;
  final VoidCallback onTap;

  const _MechanicCard({
    required this.name,
    required this.distance,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              child: const HugeIcon(icon: HugeIcons.strokeRoundedShieldUser, color: AppColors.iconActive, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.dmSans(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const HugeIcon(icon: HugeIcons.strokeRoundedStar, color: Color(0xFFFFD700), size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '$rating • $distance',
                        style: GoogleFonts.dmSans(fontSize: 13, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: AppColors.textDisabled, size: 20),
          ],
        ),
      ),
    );
  }
}

