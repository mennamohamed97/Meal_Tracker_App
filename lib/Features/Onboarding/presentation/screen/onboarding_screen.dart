import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/widgets/onboarding_data.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/widgets/skip.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/widgets/onboarding_button.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageView(
              pageController: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: screenHeight * 0.03,
            ),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: screenWidth * 0.02,
                    dotWidth: screenWidth * 0.02,
                    activeDotColor: AppColor.myGreen,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                OnboardingButton(
                  pageController: _pageController,
                  currentPage: _currentPage,
                  totalPages: onboardingData.length,
                ),
                SizedBox(height: screenHeight * 0.01),
                if (_currentPage != onboardingData.length - 1) const Skip(),
                if (_currentPage == onboardingData.length - 1)
                  SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
