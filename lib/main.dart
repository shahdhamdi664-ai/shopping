import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/features/ui/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shopping_app/features/ui/auth/screens/login/login_screen.dart';
import 'package:shopping_app/features/ui/auth/screens/register/register_screen.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/bottom_navigation_bar.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/cart/cart_screen.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/fav_screen.dart';
import 'package:shopping_app/features/ui/home/tabs/items/item_tab.dart';
import 'package:shopping_app/features/ui/home/tabs/profile/my_proifle.dart';
import 'package:shopping_app/features/ui/home/tabs/profile/profile_tab.dart';
import 'package:shopping_app/features/ui/home/tabs/profile/setting.dart';
import 'package:shopping_app/features/ui/onboarding/onboarding_screen.dart';
import 'package:shopping_app/features/ui/started_screen/started.dart';

import 'features/ui/home/tabs/items/fav/cart/checkout/checkout_item.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.onboardingRoutesName,
      routes:{
        AppRoutes.onboardingRoutesName:(context)=>OnBoardingScreen(),
        AppRoutes.loginRoutesName:(context)=>LoginScreen(),
        AppRoutes.registerRoutesName:(context)=>RegisterScreen(),
        AppRoutes.startedRoutesName:(context)=>StartedScreen(),
        AppRoutes.homeRoutesName:(context)=>HomeScreen(),
        AppRoutes.itemRoutesName:(context)=>ItemTab(),
        AppRoutes.profileRoutesName:(context)=>ProfileTab(),
        AppRoutes.myProfileRoutesName:(context)=>MyProfile(),
        AppRoutes.settingRoutesName:(context)=>Setting(),
        AppRoutes.favRoutesName:(context)=>FavScreen(),
        AppRoutes.cartRoutesName:(context)=>CartItem(),
        AppRoutes.checkoutRoutesName:(context)=>CheckoutItem(),
      },
    );
  }
}