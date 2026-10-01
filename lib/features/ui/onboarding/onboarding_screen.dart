import 'package:flutter/material.dart';
import 'package:shopping_app/features/ui/onboarding/widget/dot_indicator.dart';
import 'package:shopping_app/model/onboarding_data.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';

import 'widget/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: OnBoardingData.onBoardingData.length,
                itemBuilder: (context, index) => OnBoardingPage(
                  onBoardingData:
                  OnBoardingData.onBoardingData[index],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex != 0
                    ? GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      currentIndex - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "Prev",
                    style: AppStyles.semiBold18LightGray,
                  ),
                )
                    : SizedBox(),
                Row(
                  children: List.generate(
                    OnBoardingData.onBoardingData.length,
                        (index) => DotIndicator(
                      isActive: index == currentIndex,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentIndex <
                        OnBoardingData.onBoardingData.length - 1) {
                      pageController.animateToPage(
                        currentIndex + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushNamed(
                          context, AppRoutes.startedRoutesName);
                    }
                  },
                  child: Text(
                      currentIndex ==
                          OnBoardingData.onBoardingData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: AppStyles.semiBold18Pink
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}