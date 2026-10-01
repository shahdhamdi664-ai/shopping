import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/Home_tab.dart';
import 'package:shopping_app/features/ui/home/tabs/items/item_tab.dart';
import 'package:shopping_app/features/ui/home/tabs/profile/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget>tabs=[
    HomeTab(),ItemTab(),ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          type: BottomNavigationBarType.fixed,
          currentIndex:selectedIndex ,
          onTap: (index){
            selectedIndex=index;
            setState(() {

            });
          },
          items:[
            builtBottomNavigationBarItem(
              index:0,
              selectedIconName:AppAssets.homeIconSelected,
              unSelectedIconName: AppAssets.homeIcon,

            ),
            builtBottomNavigationBarItem(
              index:1,
              selectedIconName:AppAssets.itemIconSelected,
              unSelectedIconName: AppAssets.itemIcon,
            ),
            builtBottomNavigationBarItem(
              index:2,
              selectedIconName:AppAssets.profileIconSelected,
              unSelectedIconName: AppAssets.profileIcon,
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String selectedIconName,
    required String unSelectedIconName,
    required int index}){
    return BottomNavigationBarItem(
      icon:Align(
          alignment: Alignment.center,
          child: Image.asset(selectedIndex==index?selectedIconName:unSelectedIconName,)),
      label: '',
    );
  }
}