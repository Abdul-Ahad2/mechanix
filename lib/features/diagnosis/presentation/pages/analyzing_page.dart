import 'dart:async';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';

class AnalyzingPage extends StatefulWidget {
  const AnalyzingPage({super.key});

  @override
  State<AnalyzingPage> createState() => _AnalyzingPageState();
}

class _AnalyzingPageState extends State<AnalyzingPage> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ResultsPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  RotationTransition(
                    turns: _rotateController,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryAccent.withOpacity(0.1),
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: List.generate(3, (index) {
                          return Positioned(
                            top: 0,
                            left: 120,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: Tween(begin: 0.95, end: 1.05).animate(_pulseController),
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryAccent.withOpacity(0.15),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedAiMagic,
                          color: AppColors.primaryAccent,
                          size: 64,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Text(
                'Analyzing Symptoms',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              const _StatusCarousel(),
              const Spacer(),
              Text(
                'Hold on, comparing with 50,000+ mechanical data points...',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusCarousel extends StatefulWidget {
  const _StatusCarousel();

  @override
  State<_StatusCarousel> createState() => _StatusCarouselState();
}

class _StatusCarouselState extends State<_StatusCarousel> {
  final List<String> _statuses = [
    'Scanning audio patterns...',
    'Reviewing vehicle specs...',
    'Identifying probable causes...',
    'Consulting service manuals...',
    'Generating DIY fixes...',
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startRotation();
  }

  void _startRotation() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _statuses.length;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Text(
        _statuses[_currentIndex],
        key: ValueKey(_statuses[_currentIndex]),
        style: GoogleFonts.dmSans(
          fontSize: 16,
          color: AppColors.primaryAccent.withOpacity(0.8),
        ),
      ),
    );
  }
}
