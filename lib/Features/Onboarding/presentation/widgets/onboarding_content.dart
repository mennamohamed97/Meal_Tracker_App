import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class OnboardingContent extends StatelessWidget {
  final String image, title, subtitle;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double width = screenWidth * 0.8;
    double height = screenHeight * 0.65;
    width = width.clamp(200, 350);
    height = height.clamp(300, 500);

    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: AppColor.myGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Image.asset(
                image,
                width: width * 1.1,
                height: width * 1.1,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Text(
            title,
            style: AppStyle.boldTextStyle.copyWith(
              fontSize: screenWidth * 0.07,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Text(
            subtitle,
            style: AppStyle.normalTextStyle.copyWith(
              fontSize: screenWidth * 0.036,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
