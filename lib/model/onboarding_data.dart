

import 'package:shopping_app/core/utils/app_assets.dart';

class OnBoardingData{
  String imgPath;
  String title;
  String description;
  OnBoardingData({required this.imgPath,required this.title,required this.description});
  static List<OnBoardingData> onBoardingData=[
    OnBoardingData(
        imgPath: AppAssets.onboardingImg1,
        title: 'Choose Products',
        description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
    OnBoardingData(
        imgPath: AppAssets.onboardingImg2,
        title: 'Make Payment',
        description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
    OnBoardingData(
        imgPath:AppAssets.onboardingImg3,
        title: 'Get Your Order',
        description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'),
  ];
}