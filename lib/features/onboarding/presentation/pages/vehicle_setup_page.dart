import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/home/presentation/pages/home_page.dart';

class VehicleSetupPage extends StatefulWidget {
  const VehicleSetupPage({super.key});

  @override
  State<VehicleSetupPage> createState() => _VehicleSetupPageState();
}

class _VehicleSetupPageState extends State<VehicleSetupPage> {
  String? selectedMake;
  String? selectedModel;
  String? selectedYear;

  final List<String> makes = [
    'Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes-Benz', 'Audi', 'Tesla',
    'Nissan', 'Hyundai', 'Kia', 'Chevrolet', 'Volkswagen', 'Porsche',
    'Lexus', 'Mazda', 'Subaru', 'Jeep', 'Land Rover', 'Volvo', 'Ferrari', 'Lamborghini',
  ];

  final List<String> models = [
    'Corolla', 'Camry', 'Civic', 'Accord', 'Model S', 'Model 3', 'Model X', 'Model Y',
    'Mustang', 'F-150', 'X5', 'X3', 'C-Class', 'E-Class', 'A4', 'Q5', 'Altima',
    'Elantra', 'Sonata', 'CX-5', 'Impreza', 'Wrangler',
  ];

  final List<String> years = List.generate(
    30,
    (index) => (2025 - index).toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),

                    // --- Heading Row with "M" ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicle setup',
                              style: GoogleFonts.googleSans(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tell us about your vehicle',
                              style: GoogleFonts.googleSans(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'M',
                          style: GoogleFonts.museoModerno(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // --- Dropdowns ---
                    _buildDropdownField(
                      value: selectedMake,
                      hint: 'Select manufacturer',
                      icon: HugeIcons.strokeRoundedCar01,
                      onTap: () => _showOptions(makes, (val) {
                        setState(() {
                          selectedMake = val;
                        });
                      }),
                    ),

                    const SizedBox(height: 12),

                    _buildDropdownField(
                      value: selectedModel,
                      hint: 'Select model',
                      icon: HugeIcons.strokeRoundedSteering,
                      onTap: () => _showOptions(models, (val) {
                        setState(() {
                          selectedModel = val;
                        });
                      }),
                    ),

                    const SizedBox(height: 12),

                    _buildDropdownField(
                      value: selectedYear,
                      hint: 'Select production year',
                      icon: HugeIcons.strokeRoundedCalendar01,
                      onTap: () => _showOptions(years, (val) {
                        setState(() {
                          selectedYear = val;
                        });
                      }),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // --- Complete Setup Button ---
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: selectedMake != null &&
                          selectedModel != null &&
                          selectedYear != null
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentLime,
                    foregroundColor: AppColors.textInverse,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    'Complete Setup',
                    style: GoogleFonts.googleSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Dropdown Field Widget ---
  Widget _buildDropdownField({
    required String? value,
    required String hint,
    required List<List<dynamic>> icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.surfaceL1,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.borderMedium),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            HugeIcon(
              icon: icon,
              color: AppColors.iconInactive,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              value ?? hint,
              style: GoogleFonts.googleSans(
                fontSize: 15,
                color: value == null
                    ? AppColors.textDisabled
                    : AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            const HugeIcon(
              icon: HugeIcons.strokeRoundedCircleArrowDown01,
              color: AppColors.iconInactive,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // --- Modal to select options ---
  void _showOptions(List<String> options, Function(String) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceL1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                options[index],
                style: GoogleFonts.googleSans(
                  color: AppColors.textPrimary,
                ),
              ),
              onTap: () {
                onSelected(options[index]);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}