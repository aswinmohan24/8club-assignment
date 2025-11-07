import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/screens/onboard/experience.screen.dart';
import 'package:eight_club_test/utils/app.colors.dart';
import 'package:eight_club_test/utils/app.typography.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ExperienceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width(),
        height: context.height(),
        color: AppColors.baseColor,
        child: Center(child: Text("8Club", style: AppText.h2Bold)),
      ),
    );
  }
}
