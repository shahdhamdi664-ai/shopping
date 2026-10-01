import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key,required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return AnimatedContainer(
      height:10,
      width:isActive?40:10 ,
      margin: EdgeInsets.symmetric(horizontal:width*0.01 ),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color:isActive?AppColors.blueColor:AppColors.grayColor,
          borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}