import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/Features/Splash/presentation/widgets/splash_body.dart';
import 'package:mennaallah_mohamed/core/utils/app_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImage.splash,
            fit: BoxFit.cover,
          ),
          const SplashBody(),
        ],
      ),
    );
  }
}
