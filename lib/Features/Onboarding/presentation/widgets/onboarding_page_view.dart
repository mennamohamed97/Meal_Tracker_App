import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/widgets/onboarding_data.dart';
import 'onboarding_content.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double pageOffset = 0;
            if (pageController.position.haveDimensions) {
              pageOffset = pageController.page! - index;
            }

            return Transform.translate(
              offset: Offset(pageOffset * -50, 0),
              child: Opacity(
                opacity: (1 - pageOffset.abs()).clamp(0.0, 1.0),
                child: OnboardingContent(
                  image: onboardingData[index]["image"]!,
                  title: onboardingData[index]["title"]!,
                  subtitle: onboardingData[index]["subtitle"]!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
