import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/cart/widget/cart_item_widget.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';

class CheckoutItem extends StatelessWidget{
  const CheckoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children:[
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Shopping List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow:[
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Text("Address",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Type address here\nor pick from map",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color:AppColors.pinkColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:Icon(
                                Icons.location_on_outlined,
                                color:AppColors.whiteColor,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      CartItemWidget(
                          image: AppAssets.productImg,
                          title: 'Women’s Casual Wear',
                          price: '\$ 34.00',
                          oldPrice: '\$ 64.00',
                          rate: '4.8',
                          totalPrice:'\$ 34.00'
                      ),
                      SizedBox(height: 16),
                      CartItemWidget(
                          image: AppAssets.productImg,
                          title: 'Men’s Jacket',
                          price: '\$ 45.00',
                          oldPrice: '\$ 67.00',
                          rate: '4.7',
                          totalPrice:'\$ 45.00'
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: CustomBottom(
                  onPressed:(){},
                  text: 'Place Order',
                  textStyle:AppStyles.semiBold15White,
                  mainAxisAlignment: MainAxisAlignment.center,
                  backgroundColor: AppColors.pinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}