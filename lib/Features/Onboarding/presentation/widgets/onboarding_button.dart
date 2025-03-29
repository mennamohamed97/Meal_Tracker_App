import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/core/app_router/app_router.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class OnboardingButton extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int totalPages;

  const OnboardingButton({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double buttonWidth = screenWidth * 0.6;
    double buttonHeight = screenHeight * 0.07;
    buttonWidth = buttonWidth.clamp(180, 280);
    buttonHeight = buttonHeight.clamp(45, 60);

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: () {
          if (currentPage == totalPages - 1) {
            GoRouter.of(context).push(AppRouter.kHomeScreen);
          } else {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColor.myGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight * 0.4),
          ),
        ),
        child: Text(
            currentPage == totalPages - 1 ? AppString.start : AppString.next,
            style: AppStyle.buttonTextStyle
                .copyWith(fontSize: screenWidth * 0.046)),
      ),
    );
  }
}
