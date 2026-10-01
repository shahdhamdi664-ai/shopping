import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
typedef onValidator=String? Function(String?)?;
class CustomTxtForm extends StatelessWidget {
  double? vertical;
  Color? fillColor;
  Color colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  onValidator validator;
  TextEditingController controller;
  TextInputType? keyboardType;
  bool obscureText;
  int? maxLines;
  CustomTxtForm({super.key,
    this.colorBorderSide=AppColors.darkGrayColor,
    this.vertical,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.fillColor,
    required this.controller,
    this.keyboardType=TextInputType.text,
    this.obscureText=false,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return TextFormField(
      maxLines:maxLines ??1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical:vertical?? height*0.04,
          ),
          filled: true,
          fillColor:fillColor?? AppColors.lightWhiteColor,
          enabledBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
          focusedBorder: builtDecorationBorder(colorBorderSide: colorBorderSide),
          errorBorder: builtDecorationBorder(colorBorderSide:Colors.red),
          focusedErrorBorder: builtDecorationBorder(colorBorderSide:Colors.red),

          hintText:hintText,
          hintStyle:hintStyle?? AppStyles.medium12DarkGray,
          labelText:labelText ,
          labelStyle:labelStyle?? AppStyles.medium12DarkGray,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
      ),
      validator:validator,
      controller:controller ,
      keyboardType: keyboardType,
      obscureText:obscureText,
    );
  }
  OutlineInputBorder builtDecorationBorder({required colorBorderSide}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:BorderSide(
            color:colorBorderSide,
            width: 1
        )
    );
  }
}