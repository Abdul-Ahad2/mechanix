import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/features/onboarding/presentation/pages/login_page.dart';
import 'package:ai_mechanix/features/onboarding/presentation/pages/vehicle_setup_page.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Center(
                child: Text(
                  'M',
                  style: GoogleFonts.museoModerno(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Create account',
                style: GoogleFonts.dmSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Join AI Mechanix today',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Full name',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                  ),
                ),
                style: GoogleFonts.dmSans(fontSize: 15, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Email address',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedMail01,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.dmSans(fontSize: 15, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedLockPassword,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: HugeIcon(
                      icon: _isPasswordVisible
                          ? HugeIcons.strokeRoundedView
                          : HugeIcons.strokeRoundedViewOff,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
                style: GoogleFonts.dmSans(fontSize: 15, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedLockPassword,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: HugeIcon(
                      icon: _isConfirmPasswordVisible
                          ? HugeIcons.strokeRoundedView
                          : HugeIcons.strokeRoundedViewOff,
                      color: AppColors.iconInactive,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                  ),
                ),
                style: GoogleFonts.dmSans(fontSize: 15, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const VehicleSetupPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentLime,
                    foregroundColor: AppColors.textInverse,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.iconInactive,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.surfaceL1,
                    side: const BorderSide(color: AppColors.borderMedium),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedGoogle,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Continue with Google',
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.surfaceL1,
                    side: const BorderSide(color: AppColors.borderMedium),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedFacebook01,
                        color: Color(0xFF1877F2),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Continue with Facebook',
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
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
                      style: GoogleFonts.dmSans(
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

