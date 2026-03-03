import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ai_mechanix/core/constants/colors.dart';
import 'package:ai_mechanix/core/widgets/custom_button.dart';
import 'package:ai_mechanix/features/diagnosis/presentation/pages/analyzing_page.dart';

class AcousticRecordingPage extends StatefulWidget {
  const AcousticRecordingPage({super.key});

  @override
  State<AcousticRecordingPage> createState() => _AcousticRecordingPageState();
}

class _AcousticRecordingPageState extends State<AcousticRecordingPage> with TickerProviderStateMixin {
  late AnimationController _waveformController;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _waveformController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _waveformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.primaryAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            Text(
              'Acoustic Sync',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Hold your phone near the source of the sound. The AI will listen for mechanical irregularities.',
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 120,
              child: _isRecording ? _buildWaveform() : _buildIdleState(),
            ),
            const Spacer(),
            Text(
              _isRecording ? 'Capturing audio frequencies...' : 'Tap the microphone to start',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: _isRecording ? AppColors.primaryAccent : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isRecording = !_isRecording;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _isRecording ? AppColors.error.withValues(alpha: 0.1) : AppColors.primaryAccent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _isRecording ? AppColors.error : AppColors.primaryAccent,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: _isRecording ? HugeIcons.strokeRoundedRecord : HugeIcons.strokeRoundedMic01,
                    color: _isRecording ? AppColors.error : AppColors.primaryAccent,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            CustomButton(
              label: 'Proceed to Analysis',
              onPressed: _isRecording ? null : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AnalyzingPage()),
                );
              },
              icon: Text(
                'M',
                style: GoogleFonts.museoModerno(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildWaveform() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(20, (index) {
        return AnimatedBuilder(
          animation: _waveformController,
          builder: (context, child) {
            double height = 20 + (index % 5) * 15 * _waveformController.value;
            return Container(
              width: 4,
              height: height,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryAccent,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildIdleState() {
    return Container(
      width: double.infinity,
      height: 2,
      color: AppColors.border,
    );
  }
}
