import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/widget/counter_row.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';

import '../../../../../../core/utils/app_routes.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.03,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 22,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Product",
                      style: AppStyles.semiBold18Black,
                    ),
                    Spacer(),
                  ],
                ),

                SizedBox(height: height * 0.03),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AppAssets.productImg,
                          height: height * 0.65,
                          fit: BoxFit.cover,
                        ),
                      ),


                    ),
                    Positioned(
                      top: height * 0.05,
                      right: width * 0.10,
                      child: Container(
                        width: width * 0.09,
                        height: width* 0.09,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: AppColors.darkGrayColor,
                          icon:Icon(
                            Icons.favorite,
                            color: AppColors.pinkColor,
                          ),
                          iconSize: 20,
                        ),
                      ),)
                  ],
                )
                ,
                SizedBox(height: height * 0.02),
                Text(
                  'Mens Starry',
                  style: AppStyles.semiBold20Black,
                ),
                SizedBox(height: height * 0.003),
                Text(
                  'Vision Alta Men’s Shoes Size (All Colours) Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular14BBlack,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '100\$',
                      style: AppStyles.semiBold18Pink,
                    ),
                    CounterRow()
                  ],
                ),
                SizedBox(height: height * 0.05),
                CustomBottom(
                  onPressed: (){
                    Navigator.pushNamed(
                        context, AppRoutes.cartRoutesName);
                  },
                  text: 'Add to card',
                  textStyle:AppStyles.semiBold15White,
                  mainAxisAlignment: MainAxisAlignment.center,
                  backgroundColor: AppColors.pinkColor,
                  icon:true,
                  iconWidget: Icon(Icons.shopping_cart_checkout,color:AppColors.whiteColor,size: 25,),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}