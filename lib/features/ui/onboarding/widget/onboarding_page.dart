import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/model/onboarding_data.dart';
import 'package:shopping_app/core/utils/app_styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.onBoardingData});

  final OnBoardingData onBoardingData;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          onBoardingData.imgPath,
          height: height * 0.50,
          fit: BoxFit.contain,
        ),

        SizedBox(height: height * 0.01),

        Text(
          onBoardingData.title,
          style: AppStyles.extraBold24Black,
        ),

        SizedBox(height: height * 0.01),

        Text(
          onBoardingData.description,
          style: AppStyles.semiBold14Gray,
        ),
      ],
    );
  }
}