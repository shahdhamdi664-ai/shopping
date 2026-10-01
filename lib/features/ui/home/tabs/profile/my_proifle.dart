import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
import 'package:shopping_app/features/ui/widget/custom_text_form.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});
  final TextEditingController userNameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
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
                      "Profile",
                      style:AppStyles.semiBold18Black,
                    )
                  ],
                ),
                SizedBox(height: height*0.02),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppAssets.profileImg),
                ),

                SizedBox(height: height*0.04),
                CustomTxtForm(
                  controller: userNameController,
                  prefixIcon: Icon(Icons.person,color: AppColors.darkGrayColor,size:  25,),
                  hintText: 'Full Name',
                ),
                SizedBox(
                  height:height*0.02 ,
                ),
                CustomTxtForm(
                  controller:phoneController ,
                  prefixIcon: Icon(Icons.call_outlined,color: AppColors.darkGrayColor,size:  25,),
                  hintText: 'Phone',
                ),
                SizedBox(
                  height:height*0.06 ,
                ),
                SizedBox(
                  height: height*0.1,
                  width: double.infinity,
                  child: CustomBottom(
                    onPressed: (){
                    },
                    text: 'Save',
                    textStyle: AppStyles.semiBold15White,
                    backgroundColor: AppColors.pinkColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}