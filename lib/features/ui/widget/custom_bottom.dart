import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_styles.dart';


class CustomBottom extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  TextStyle? textStyle;
  Color? backgroundColor;
  Color? borderColor;
  bool icon;
  Widget? iconWidget;
  MainAxisAlignment? mainAxisAlignment;
  double boarderRadius;
  CustomBottom({super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor=AppColors.whiteColor,
    this.textStyle,
    this.borderColor,
    this.icon=false,
    this.iconWidget,
    this.mainAxisAlignment=MainAxisAlignment.start,
    this.boarderRadius=8
  });

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(

            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(boarderRadius),
                side: BorderSide(
                    color:borderColor?? AppColors.pinkColor
                )
            ),
            padding: EdgeInsets.symmetric(
              vertical: height*0.02,
            )
        ),
        onPressed: onPressed,
        child:icon?
        Row(
          mainAxisAlignment: mainAxisAlignment!,
          children: [
            iconWidget!,
            Text(text,style:textStyle?? AppStyles.semiBold23Pink,),

          ],
        ):
        Text(text,style:textStyle?? AppStyles.semiBold23Pink,)

    );
  }
}