import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/cart/widget/build_price_row.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/cart/widget/cart_item_widget.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                ],
              ),
              SizedBox(height: height * 0.025),
              Text(
                "Shopping List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CartItemWidget(
                        image: AppAssets.productImg,
                        title: 'Women’s Casual Wear',
                        price: '\$ 34.00',
                        oldPrice: '\$ 64.00',
                        rate: '4.8',
                        totalPrice: '\$ 34.00',
                      ),
                      SizedBox(height: height * 0.02),
                      CartItemWidget(
                        image: AppAssets.productImg,
                        title: 'Men’s Jacket',
                        price: '\$ 45.00',
                        oldPrice: '\$ 67.00',
                        rate: '4.7',
                        totalPrice: '\$ 45.00',
                      ),
                      SizedBox(height: height * 0.03),
                      BuildPriceRow(
                        title: "Subtotal",
                        value: "\$ 79.00",
                      ),
                      SizedBox(height: height * 0.012),
                      BuildPriceRow(
                        title: "Tax and Fees",
                        value: "\$ 3.00 ",
                      ),
                      SizedBox(height: height * 0.012),
                      BuildPriceRow(
                        title: "Delivery Fee",
                        value: "\$ 2.00 ",
                      ),
                      SizedBox(height: height * 0.02),
                      Divider(),
                      SizedBox(height: height * 0.02),
                      BuildPriceRow(
                        title: "Order Total",
                        value: "\$ 84.00",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.025),
              SizedBox(
                width: double.infinity,
                height: height * 0.07,
                child: CustomBottom(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.checkoutRoutesName,
                    );
                  },
                  text: 'Add to card',
                  textStyle: AppStyles.semiBold15White,
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