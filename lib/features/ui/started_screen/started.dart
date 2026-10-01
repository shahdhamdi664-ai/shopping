import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
class StartedScreen extends StatelessWidget{
  const StartedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.getStartedImg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:width*0.02, vertical: height*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                    "You want\nAuthentic, here\nyou go!",
                    textAlign: TextAlign.center,
                    style:AppStyles.semiBold34White
                ),
                SizedBox(height:height*0.01 ),
                Text(
                    "Find it here, buy it now",
                    style:AppStyles.regular14LightWhite
                ),
                SizedBox(height:height*0.05),
                SizedBox(
                  height: height*0.1,
                  width: double.infinity,
                  child: CustomBottom(
                    onPressed: (){
                      Navigator.pushNamed(
                          context, AppRoutes.loginRoutesName);
                    },
                    text: 'Login',
                    textStyle:AppStyles.semiBold23White,
                    backgroundColor: AppColors.pinkColor,
                  ),
                ),
                SizedBox(height: height*0.02),
                SizedBox(
                  height: height*0.1,
                  width: double.infinity,
                  child: CustomBottom(
                    onPressed: (){
                      Navigator.pushNamed(
                          context, AppRoutes.registerRoutesName);
                    },
                    text: 'Register',
                    textStyle:AppStyles.semiBold23Pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}