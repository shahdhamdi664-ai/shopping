import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal:width*0.02,vertical: height*0.03),
          child:SingleChildScrollView (
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(
                          context, AppRoutes.profileRoutesName);
                    },
                        icon: Icon(Icons.arrow_back_ios_new_outlined,size: 22,)),
                    SizedBox(width: width*0.425,),
                    Text(
                      "Setting",
                      style:AppStyles.semiBold18Black,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Language',style:AppStyles.medium18Black,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}