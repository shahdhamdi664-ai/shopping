import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/profile/widget/build_menu_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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
                Text(
                  "Profile",
                  style:AppStyles.semiBold18Black,
                ),
                SizedBox(height: height*0.02),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppAssets.profileImg),
                ),

                SizedBox(height: height*0.02),
                Text(
                    "User full Name",
                    style:AppStyles.semiBold18Pink
                ),
                SizedBox(height:height*0.1),
                BuildMenuItem(
                  onPressed: (){
                    Navigator.pushNamed(
                        context, AppRoutes.myProfileRoutesName);
                  },
                  icon: Icons.person_outline,
                  title: "My Profile",
                ),
                BuildMenuItem(
                  onPressed: (){},
                  icon: Icons.shopping_bag_outlined,
                  title: "My Orders",
                ),
                BuildMenuItem(
                  onPressed: (){
                    Navigator.pushNamed(
                        context, AppRoutes.favRoutesName);
                  },
                  icon: Icons.favorite_border,
                  title: "My Favorites",
                ),
                BuildMenuItem(
                  onPressed: (){
                    Navigator.pushNamed(
                        context, AppRoutes.settingRoutesName);
                  },
                  icon: Icons.settings_outlined,
                  title: "Settings",
                ),
                SizedBox(height: height*0.01),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: AppColors.pinkColor,
                  thickness: 1,
                ),
                SizedBox(height: height*0.02),
                Row(
                  children:[
                    Icon(Icons.logout, size: 22),
                    SizedBox(width: width*0.02),
                    Text(
                      "Log Out",
                      style: AppStyles.medium18Black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:AppColors.pinkColor,
        onPressed: () {},
        child:Icon(Icons.shopping_bag_outlined, color:AppColors.whiteColor ),
      ),
    );
  }
}