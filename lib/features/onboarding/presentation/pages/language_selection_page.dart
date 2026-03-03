import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/onboarding/presentation/pages/login_page.dart';
import 'package:ai_mechanix/features/onboarding/presentation/pages/signup_page.dart';
import 'package:lottie/lottie.dart';

class AnimatedCarHero extends StatelessWidget {
  const AnimatedCarHero({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 800,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Lottie.network(
          'https://lottie.host/a2048b1d-e54f-46d0-b86f-110bb05f3eaa/tl5ZlisjP3.json',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
 



class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'English';
  late PageController _pageController;

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'nativeName': 'English', 'flag': '🇺🇸'},
    {'name': 'Urdu', 'nativeName': 'اردو', 'flag': '🇵🇰'},
    {'name': 'Arabic', 'nativeName': 'العربية', 'flag': '🇸🇦'},
    {'name': 'French', 'nativeName': 'Français', 'flag': '🇫🇷'},
    {'name': 'Spanish', 'nativeName': 'Español', 'flag': '🇪🇸'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (_) {},
        children: [
          _buildWelcomePage(context),
          _buildLanguageSelectionPage(context),
        ],
      ),
    );
  }

  Widget _buildWelcomePage(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.background.withValues(alpha: 0),
                        AppColors.background,
                      ],
                    ),
                  ),
                ),
                Center(
                  child:const AnimatedCarHero(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Precision care for\nthe modern driver.',
                    style: GoogleFonts.googleSans(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'AI-driven diagnostics meet expert mechanical support. Keep your vehicle performing at its absolute peak.',
                    style: GoogleFonts.googleSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Get Started'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.googleSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.iconInactive,
                          ),
                          children: [
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelectionPage(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              'Select Language',
              style: GoogleFonts.googleSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: -1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Choose your preferred language',
            style: GoogleFonts.googleSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: _languages.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final lang = _languages[index];
              final isSelected = _selectedLanguage == lang['name'];

              return GestureDetector(
                onTap: () => setState(() => _selectedLanguage = lang['name']!),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceL1,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected ? AppColors.borderStrong : AppColors.borderSubtle,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang['name']!,
                              style: GoogleFonts.googleSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              lang['nativeName']!,
                              style: GoogleFonts.googleSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textDisabled,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedCheckmarkCircle02,
                          color: AppColors.iconActive,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SignupPage()),
                      );
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



